class Client::MeasurementsController < ApplicationController


  def show
    render "show.html.erb"
  end

  def new
    render "measurements.html.erb"
  end

  def create
    @measurement = {
      "name" => params[:name],
      "height" => params[:height],
      "chest" => params[:chest],
      "waist" => params[:waist],
      "hips" => params[:hips],
      "thigh" => params[:thigh],
      "calf" => params[:calf],
      "inseam" => params[:inseam],
      "upper_arm_circumference" => params[:upper_arm_circumference],
      "arm_length" => params[:arm_length],
      "shoulder_to_shoulder_width" => params[:shoulder_to_shoulder_width],
      "armpit_to_waist" => params[:armpit_to_waist],
      "waist_to_hip" => params[:waist_to_hip]
    }

    response = Unirest.post("http://localhost:3000/api/measurements/", parameters: @measurement
      )

    if response.code == 200
      flash[:success] = "Measurements have been added"
      redirect_to "/client/pattern"
    else
      @errors = response.body["errors"]
      render "measurement.html.erb"
    end
  end


  def update
    @measurement = {
      "name" => params[:name],
      "height" => params[:height],
      "chest" => params[:chest],
      "waist" => params[:waist],
      "hips" => params[:hips],
      "thigh" => params[:thigh],
      "calf" => params[:calf],
      "inseam" => params[:inseam],
      "upper_arm_circumference" => params[:upper_arm_circumference],
      "arm_length" => params[:arm_length],
      "shoulder_to_shoulder_width" => params[:shoulder_to_shoulder_width],
      "armpit_to_waist" => params[:armpit_to_waist],
      "waist_to_hip" => params[:waist_to_hip]
    }

    response = Unirest.patch("http://localhost:3000/api/measurements/#{params[:id]}", parameters: @measurement
      )

    if response.code == 200
      flash[:success] = "Your measurements have been successfully updated"
      redirect_to "/client/measurements/#{params[:id]}"
    else
      @errors = response.body['errors']
      render "edit.html.erb"
    end    
  end

  def destroy
    response = Unirest.delete("http://localhost:3000/api/products/#{params['id']}")
    flash[:success] = "Your Measurements have been removed"
    redirect_to "/client/"
  end


end
