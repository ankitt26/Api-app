class Api::V1::CarsController < ApplicationController
  def index
    cars = Car.all
    render json: cars, status: 200
  end

  def show
    car = Car.find_by(id: params[:id])
    if car
      render json: car, status: 200
    else
      render json: 'Not found', status: 404
    end
  end

  def create
    car = Car.new(
      name: car_params[:name],
      brand: car_params[:brand],
      price: car_params[:price]
    )

    if car.save
      render json: { message: 'Car created' }, status: 201
    else
      render json: { error: 'Car not saved' }, status: 422
    end
  end

  private

  def car_params
    params.require(:car).permit([
      :name, :brand, :price
      ])
  end
end
