class DoctorsController < ApplicationController
  before_action :admin?
  
  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @doctor = Doctor.new
    #RANDOMLY GENERATE X AND Y COORDINATES
    @location_x = rand(2)
    @location_y = rand(3)
    @hp = rand(25..100)
  end

  def create
    @doctor = Doctor.create(doctor_params)
    redirect_to @doctor
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    @doctor.update(doctor_params)
    redirect_to @doctor
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    redirect_to birds_path
  end

  private
  def doctor_params
    params.require(:doctor).permit(:hp, :location_x, :location_y)
  end


end
