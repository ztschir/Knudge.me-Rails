class UserContentServicesController < ApplicationController
  # GET /users
  # GET /users.json
  
  require 'java'
  require 'YodleeClient.jar'
  module KnudgeMeYodleeCall
    include_package "com.KnudgeMeYodlee"
  end
  
  def index
    @user_banks = UserContentService.new
    refresh_banks_list

    respond_to do |format|
      format.js
      format.html
      format.json { render :json => @banks.map(&:attributes) }
    end
    
  end

  def show

  end

  def new
    
  end

  def edit

  end

  def create
    @user_banks = UserContentService.new
    @content_id = content_id
    success = KnudgeMeYodleeCall::KnudgeMeYodlee.addItem(current_user.id, @content_id, params.to_query(:form))
    if success
      flash[:success] = "Added bank"
    else
      flash[:error] = "Could not add bank, please enter credentials again"
      @credentials = nil
    end
  
    respond_to do |format|
      format.html { redirect_to :new }
      format.js
    end

  end

  def update

  end

  def destroy

  end

  def load_credentials
    @credentials = JSON.parse(%Q(#{params[:credentials]}))
    respond_to do |format|
      format.js {render :layout => false}
    end
  end

  def load_banks
    refresh_banks_list
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  private

  def content_id
    if !params[:contentID] && params[:user_content_service][:content_tokens] && !params[:user_content_service][:content_tokens].empty?
      Integer(params[:user_content_service][:content_tokens])
    elsif params[:contentID]
      Integer(params[:contentID])
    end
  end


  def refresh_banks_list
    @banks = YodleeContentServiceInfo.content_service_display_name(params[:q]).select_id_and_name.limit(10)
  end
  
end
