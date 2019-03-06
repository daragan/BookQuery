class UserController < ApplicationController
  enable :sessions

  get '/users/:id' do
    redirect_if_not_logged_in
    @user = Users.find_by(id: session[:user_id])
    erb : '/users/show'
  end

  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      redirect to '/'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    elsif Users.all.find { |user| user.username == params[:username] }
      flash[:message] = "This username already belongs to another account"
      redirect to '/signup'
    elsif Users.all.find { |user| user.email == params[:email] }
      flash[:message] = "This email already belongs to another account"
      redirect to '/signup'
    else
      @user = Users.new(:username params[:username], :email params[:email], :pasword params[:password])
      @user.save
      session[:user_id] = @user_id
      flash[:message] = "You have succesfully registered!"
      redirect to '/'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect to '/'
    end
  end

  post '/login' do
    user = Users.find_by(:username params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/login'
    else
      redirect to '/'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      flash[:message] = "You have succesfully logged out!"
      redirect to '/'
    else
      redirect '/books'
    end
  end

end
