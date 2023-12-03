class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:user][:name], password: params[:user][:password], email: params[:user][:email])

    if @user.save
      flash[:success] = "User created successfully"
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update!(:name => params[:user][:name], :password => params[:user][:password], :email => params[:user][:email])
        flash[:success] = 'Details updated successfully'
        redirect_to new_user_path
      else
        render :edit, status: :unprocessable_entity
      end
  end

  private

  def allowed_user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
