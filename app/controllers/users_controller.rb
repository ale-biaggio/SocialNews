class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_only, :except => :show
  
    def index
      @users = User.all
    end
  
    def show
      @user = User.find(params[:id])
      @id= User.find(params[:id]).id
      @posts= Post.where(user_id: params[:id])
      @comment = Comment.new
    end
  
    def update
      @user = User.find(params[:id])
      if @user.update_attributes(secure_params)
        redirect_to users_path, :notice => "User updated."
      else
        redirect_to users_path, :alert => "Unable to update user."
      end
    end
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to users_path, :notice => "User deleted."
    end
    
    private
    
    def admin_only
        unless current_user.admin?
            redirect_to posts_url, :alert => "Access denied."
        end
    end
    
    def secure_params
        params.require(:user).permit(:role)
    end
    
end