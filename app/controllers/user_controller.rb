class UserController < ApplicationController
  def index
    @user = User.all
  end

  def new

  end

  def create
    email = params[:email]
    password = params[:password]
    User.create(
      email: email,
      password: password
      )
      
    redirect_to '/'
  end

  def show
    @id = params[:id]
    @email = User.find(@id).email
    @password = User.find(@id).password
  end
  
  def login
    
  end
  
  def login_process
    email = params[:email]
    password = params[:password]
    
    if User.find_by(email: email)
      user = User.find_by(email: email)
      if user.password == password
        session[:user_id] = user.id
        flash[:notice] = 'success login'
        redirect_to '/'
      else
        flash[:notice] = 'wrong password'
        redirect_to :back
      end
    else
        flash[:notice] = 'wrong email'
      redirect_to :back
    end

  end
  
  def logout
    session.clear
    redirect_to '/'
  end
  
  
  
end
