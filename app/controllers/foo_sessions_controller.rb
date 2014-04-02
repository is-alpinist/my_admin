class SessionsController < ApplicationController
  #before_action :set_session, only: [:show, :destroy]
  
  def new
  end
  
  def create
    user = User.find_by_email(user_params[:email])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
#  private
#    # Use callbacks to share common setup or constraints between actions.
#   def set_session
#      @session = Session.find(params[:id])
#    end
#
# Never trust parameters from the scary internet, only allow the white list through.
#    def session_params
#     params[:session]
#    end
# end


