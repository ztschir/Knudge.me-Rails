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
    @banks = YodleeContentServiceInfo.content_service_display_name(params[:q]).select_id_and_name.limit(10)

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
    @userBanks = UserContentService.new
    if !params[:contentID] && params[:user_content_service][:content_tokens] && !params[:user_content_service][:content_tokens].empty?
      @user = current_user
      @contentID = Integer(params[:user_content_service][:content_tokens])
      @bankForm = KnudgeMeYodleeCall::KnudgeMeYodlee.getHTMLForm(@user.id, @contentID)
    elsif params[:contentID]
      @user = current_user
      @contentID = Integer(params[:contentID])

      @htmlForm = self.request.body.read
      
      #@htmlForm = self.request.format;
      @success = KnudgeMeYodleeCall::KnudgeMeYodlee.addItem(@user.id, @contentID, @htmlForm)
      if @success
        flash[:success] = "Added bank"
      else
        flash[:error] = "Could not add bank, please enter credentials again"
      end
      
      
      @bankForm = params.to_query(:form)
      
    else
      @bankForm = " "
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
  
end
