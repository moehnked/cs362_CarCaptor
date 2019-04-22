class CarsController < ApplicationController
  def new
    @car = Car.new
  end
  
  def index
    @cars = Car.all
  end
  
  def create
    @workflow = CreateCar.new(year: params[:car][:year], make: params[:car][:make], model: params[:car][:model], coolness_value: params[:car][:coolness_value])
    @workflow.create
    if @workflow.success?
      redirect_to cars_path
    else
      @car = @workflow.car
      render :new
    end
  end
end
