class AccessController < ApplicationController

  layout 'admin'

  def menu
    # displays text and links
  end

  def login
    # login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Logged in successfully."
      redirect_to(admin_path)
    else
      flash.now[:notice] = "Invalid username/password." # Shows flash notice immediately
      render('login')
    end

  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to(access_login_path)
  end

end
