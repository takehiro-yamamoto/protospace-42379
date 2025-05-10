class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes.includes(:user)
    @comments = @user.comments.includes(:prototype)
  end
end
