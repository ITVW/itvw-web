class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      # create a new session
    # authenticate
      # return the user object and session info
        render :json => @user, :status => :ok,
               include: {:session => {:only => :session_key}}
    else
      render :json => @user.errors, :status => :bad_request
    end
  end
  
  def show
    #render :json => @user, :status => :ok
  end

  def authenticate
  end
  
  private

    def user_params
      params.require(:user).permit(:carrier_id, :phone, :nickname)
    end
end
