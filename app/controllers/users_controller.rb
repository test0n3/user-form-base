class UsersController < ApplicationController
  def index
    @user = User.last
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :username,
      :email,
      :email_confirmation,
      :password,
      :password_confirmation,
      :password_hint
    )
  end

  def self.check_name(my_data)
    temp = my_data.downcase.split(' ')
    temp.each_with_index do |a|
      if a.length >= 3
        if a[0,1] != "d"
          a.capitalize!
        end
      end
    end
    temp.join(' ')
  end
end

