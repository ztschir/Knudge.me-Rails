class TransactionsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate, :only => [:index]
  before_filter :correct_user, :only => [:index]

  def index
    @transactions = current_user.transactions.order(sort_column + " " + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @transactions }
    end
  end
  
  def authenticate
    deny_access unless signed_in? 
  end
  
  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end
  
  private

  def sort_column
    Transaction.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
