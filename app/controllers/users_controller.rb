class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  before_filter :authenticate, :only => [:edit, :update, :show]
  before_filter :correct_user, :only => [:edit, :update, :show]
  
  require 'java'
  require 'YodleeClient.jar'
  module KnudgeMeYodleeCall
    include_package "com.KnudgeMeYodlee"
  end
  
  def index
    @user = current_user

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @user }
    end
  end

  def show
    @user = current_user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @title = "Sign Up"
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @title = "Edit user"
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    user_id = KnudgeMeYodleeCall::KnudgeMeYodlee.registrarYodleeUser(params[:user][:email], params[:user][:password])
    respond_to do |format|
      unless user_id == -1
        sign_in find_by_id(user_id)
        flash[:success] = "Welcome to Knudge.Me"
        format.html { redirect_to @user }
      else
        format.html { render :action => :new }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
        @title = "Sign up"
      end
    end
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated."
        format.html { redirect_to @user }
        #format.json { head :ok }
      else
        @title = "Edit user"
        format.html { render :action => :edit }
        #format.json { render json @user.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = current_user
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
  
end
