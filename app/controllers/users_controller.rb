class UsersController < ApplicationController
 
  before_action :authorize, only: [:index, :show, :edit, :update, :destroy]
  before_action :admin_user, only: [:index, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
  @user = User.new(user_params)
  if @user.save
    session[:user_id] = @user.id
    redirect_to root_url, notice: "Thank you for signing up!"
  else
    render "new"
  end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
     @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, notice: "This record has been updated!"
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "This user has been deleted!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first, :last, :email, :password, :password_confirmation, :admin)
    end
end
