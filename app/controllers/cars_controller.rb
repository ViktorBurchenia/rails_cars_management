# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]

  SORTING = {
    'date_added_asc' => { date_added: :asc },
    'date_added_desc' => { date_added: :desc },
    'price_asc' => { price: :asc },
    'price_desc' => { price: :desc }.freeze
  }.freeze

  # GET /cars or /cars.json
  def index
    @cars = Car.all.page params[:page]
    @cars_total = Car.all
    custom_sorting if params[:sort_by].present?
  end

  # GET /cars/1 or /cars/1.json
  def show; end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit; end

  # POST /cars or /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to car_url(@car), notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to car_url(@car), notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /cars/1/edit
  def search
    search_params = {}
    search_params[:make] = params[:make] if params[:make].present?
    search_params[:model] = params[:model] if params[:model].present?
    if params[:year_from].present? && params[:year_to].present?
      search_params[:year] = (params[:year_from].to_i..params[:year_to].to_i)
    elsif params[:year_from].present?
      search_params[:year] = (params[:year_from].to_i..Float::INFINITY)
    elsif params[:year_to].present?
      search_params[:year] = (1..params[:year_to].to_i)
    end
    if params[:price_from].present? && params[:price_to].present?
      search_params[:price] = (params[:price_from].to_i..params[:price_to].to_i)
    elsif params[:price_from].present?
      search_params[:price] = (params[:price_from].to_i..Float::INFINITY)
    elsif params[:price_to].present?
      search_params[:price] = (1..params[:price_to].to_i)
    end

    @cars = Car.where(search_params).page params[:page]
    render 'search/search_car'
  end

  private

  def custom_sorting
    sorting = SORTING[params[:sort_by]]
    @cars = Car.order(sorting).all.page params[:page]
  end 

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:make, :model, :year, :odometer, :price, :description, :date_added)
  end
end
