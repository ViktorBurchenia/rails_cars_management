# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]
  # before_action :my_search, only: :index

  SORTING = {
    'date_added_asc' => { date_added: :asc },
    'date_added_desc' => { date_added: :desc },
    'price_asc' => { price: :asc },
    'price_desc' => { price: :desc }
  }.freeze

  # GET /cars or /cars.json
  def index
    cars = Car.where(build_search_params)
    @cars_total = cars.count
    @cars = cars.page(params[:page])
    custom_sorting if params[:sort_by].present?
    my_search
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
    @cars = Car.where(build_search_params).page(params[:page])
    render 'search/search_car'
  end

  private

  def build_search_params
    search_params = {}
    search_params[:make] = params[:make] if params[:make].present?
    search_params[:model] = params[:model] if params[:model].present?

    add_year_param(search_params)
    add_price_param(search_params)

    search_params
  end

  def add_year_param(search_params)
    year_from = params[:year_from].present? ? params[:year_from].to_i : 1
    year_to = params[:year_to].present? ? params[:year_to].to_i : Float::INFINITY
    search_params[:year] = (year_from..year_to)
  end

  def add_price_param(search_params)
    price_from = params[:price_from].present? ? params[:price_from].to_i : 1
    price_to = params[:price_to].present? ? params[:price_to].to_i : Float::INFINITY
    search_params[:price] = (price_from..price_to)
  end

  def custom_sorting
    sorting = SORTING[params[:sort_by]]
    @cars = @cars.order(sorting).all.page params[:page]
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  def user_search_params
    %i[make model year_from year_to price_from price_to].each_with_object({}) do |column, arr|
      next if params[column].blank?

      arr[column] = params[column]
    end
  end

  def my_search
    return unless current_user.present? && params[:sort_by].nil? && user_search_params.present?

    UserSearch.create(**user_search_params, user: current_user)
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:make, :model, :year, :odometer, :price, :description, :date_added)
  end
end
