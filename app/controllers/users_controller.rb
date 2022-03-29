class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @users = User.where(role: "user") if @user.role == "admin"
    @posts = Post.where(user_id: @user.id).order("created_at desc").where.not(image: nil)
  end
end
