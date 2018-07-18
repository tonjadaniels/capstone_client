class Client::UsersController < ApplicationController

  # def index
  #   render "new.html.erb"
  # end

  def new
    render "new.html.erb"
  end

  def show
    render "show.html.erb"
  end

  def create
    client_params = {
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    }

    response = Unirest.post(
      "http://localhost:3000/api/users",
      parameters: client_params)

    if response.code == 200
      session[:email] = response.body["email"]
      flash[:success] = "Successfully created account!"
      redirect_to "client/measurements"
    else
      flash[:warning] = "Invalid email or password!"
      redirect_to "/client/users"
    end
  end
end