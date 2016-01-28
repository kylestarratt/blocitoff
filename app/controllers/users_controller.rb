class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    if current_user.update_attributtes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
      flash[:notice] = "Information can't update"
      redirect_to edit_user_registration_path
    end
  end

  def show
    @user = current_user
    @items = @user.items
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
