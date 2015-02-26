class AccessController < ApplicationController


  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(username: params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
      
    if !found_user
      flash.now[:alert] = "Invalid username"
      render :login
    elsif !authorized_user
      flash.now[:alert] = "Invalid password"
      render :login
    else
      session[:user_id] = authorized_user.id
      redirect_to site_path, flash: {success: "LOGGED IN."} 
    end
  end



  def home
  end
  def login
  end

  def signup
    @user = User.new

    render :signup
  end

  def create
     @user = User.create(password_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to site_path, flash: { notice: "Welome to BDMI" }
    else
      
      render :signup, flash: { alert: "Need to enter a username." }
    end
  

  end

  def logout
    session.delete(:user_id)
    @current_user = nil
    redirect_to login_path, flash: { notice: "LOGGED OUT."}
  end


  private 
    def password_params
      params.require(:user).permit(:username, :password, :password_digest)
    end

    def prevent_login_signup
      if session[:user_id]
        redirect_to site_path
      end
    end


end 
























 # def attempt_login
 #    if params[:username].present? && params[:password].present?
 #      found_user = User.where(username: params[:username]).first
 #      if found_user

 #        authorized_user = found_user.authenticate(params[:password])
      
 #        if authorized_user
 #          redirect_to site_path, flash: {success: "LOGGED IN."}
 #        end
 #      else 
 #         flash[:alert] = "No Comment for You"  
 #      end
 #    end
 #  end
