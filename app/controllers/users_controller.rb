class UsersController < ApplicationController
  def new
     @user = User.new
  end
  
  def show
     @user = User.find(params[:id])
  end
  
  def index
     @user = User.find(6)
  end
  
   def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Ruby On Us!"
      redirect_to @user # Handle a successful save.
    else
      render 'new'
    end
   end
  
    private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
  
end
