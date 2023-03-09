class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_only, :except => [ :show, :edit, :destroy, :update]
  
    def index
      @users = User.all
    end
    
    def edit
      @user = User.find(params[:id])
    end
    
    def show
      @user = User.find(params[:id])
      @id= User.find(params[:id]).id
      @posts= Post.where(user_id: params[:id])
      @comment = Comment.new
    end
  
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to  user_path(current_user.id), :notice => "User updated."
      else
        redirect_to user_path(current_user.id), :alert => "Unable to update user."
      end
    end
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to posts_url, :notice => "User deleted."
    end
    
    private
    
    def admin_only
      unless current_user.admin?
          redirect_to posts_url, :alert => "Access denied."
      end
  end
    
    def user_params
        params.require(:user).permit(:name, :surname, :username, :phone, :email)
    end
    
end