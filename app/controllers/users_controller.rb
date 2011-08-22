class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.roles << Role.where(:name => :member)
    if @user.save
      redirect_to root_url, :notice => "Registration successful."
    else
      render :action => 'new'
    end
  end

  def edit
    if current_user
      @user = current_user
    else
      raise CanCan::AccessDenied
    end
  end

  def update
    unless current_user
      raise CanCan::AccessDenied
    end
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice  => "Successfully updated profile."
    else
      render :action => 'edit'
    end
  end
end
