# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def edit
    # before_action
  end

  def update
    if @user.update(user_parameters)
      redirect_to root_path, notice: 'Atualização realizada com sucesso!'
    else
      redirect_to edit_user_path(@user), alert: 'Problemas ao atualizar.'
    end
  end

  private

  def user_parameters
    params.require(:user).permit(:api_key, :api_secret_key)
  end

  def set_user
    @user = user_signed_in? ? current_user : User.new
  end
end
