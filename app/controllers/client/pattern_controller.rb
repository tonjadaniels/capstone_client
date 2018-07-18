class Client::PatternController < ApplicationController

def update
  @pattern = {
    "clothing" => params[:clothing],
    "fabric" => params[:fabric],
    "yard" => params[:yard]
  }
  response = Unirest.patch("http://localhost:3000/api/user/#{params[:id]}", parameters: @user
    )

  if response.code == 200
    flash[:success] = "The item has been successfully processed"
    redirect to "/client/users/#{params[:id]}"
  else
    @errors = response.body['errors']
    render "show.html.erb"
  end

end
