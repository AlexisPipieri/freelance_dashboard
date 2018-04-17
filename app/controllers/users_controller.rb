class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update ]

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to edit_user_path
  end

  def dashboard
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :address,
      :phone_number, :siret)
  end
end
