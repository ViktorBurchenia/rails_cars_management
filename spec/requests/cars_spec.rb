# frozen_string_literal: true

require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe CarsController, type: :controller do
  describe 'GET #index' do
    let(:car) { create(:car) }

    context 'without search params' do
      before { car }

      it 'returns all cars' do
        get :index

        expect(assigns(:cars)).to match_array([car])
      end
    end

    context 'count cars' do
      before { car }

      it 'returns amount of cars' do
        get :index

        expect(assigns(:cars_total)).to eq(1)
      end
    end

    context 'with search params' do
      let(:car1) { create(:car, make: 'Honda', model: 'Civic', year: 2021, price: 15_000) }
      let(:car2) { create(:car, make: 'Toyota', model: 'Corolla', year: 2022, price: 18_000) }
      let(:car3) { create(:car, make: 'Ford', model: 'Mustang', year: 2023, price: 20_000) }
      let(:car4) { create(:car, make: 'Tesla', model: 'Model 3', year: 2022, price: 30_000) }

      before do
        car1
        car2
        car3
        car4
      end

      context 'when car found' do
        it 'returns found cars by make' do
          get :index, params: { make: 'Honda' }

          puts "assigns(:cars) = #{assigns(:cars)}"
          puts "expected cars = [#{car1}]"
          expect(assigns(:cars)).to match_array([car1])
        end

        it 'returns found cars by model' do
          get :index, params: { model: 'Corolla' }

          expect(assigns(:cars)).to match_array([car2])
        end

        it 'returns found cars by year' do
          get :index, params: { year_from: 2022, year_to: 2024 }

          expect(assigns(:cars)).to match_array([car2, car3, car4])
        end

        it 'returns found cars by price' do
          get :index, params: { price_from: 15_000, price_to: 20_000 }

          expect(assigns(:cars)).to match_array([car1, car2, car3])
        end

        it 'returns found cars with custom sorting' do
          get :index, params: { sort_by: 'price_desc' }

          expect(assigns(:cars)).to eq([car4, car3, car2, car1])
        end
      end
    end
  end

  describe 'POST #create' do
    let(:car_params) do
      {
        car:
          {
            make: 'Honda',
            model: 'Civic',
            year:,
            odometer: 52_421,
            price: 15_000,
            description: 'AWD',
            date_added: '2013-04-25'
          }
      }
    end

    context 'car was created' do
      let(:year) { 2022 }

      it 'add new car to db' do
        expect do
          post :create, params: car_params
        end.to change(Car, :count).by(1)
      end
    end

    context 'car was not created' do
      let(:year) { 2025 }

      it 'add new car to db' do
        expect do
          post :create, params: car_params
        end.not_to change(Car, :count)
      end
    end
  end

  describe 'PATCH #update' do
    let!(:car) { create(:car, year: 2000) }
    let(:car_params) { { car: { year: } } }

    context 'car was update' do
      let(:year) { 2022 }

      it 'update car in db' do
        patch :update, params: { id: car.id }.merge(car_params)

        expect(car.reload.year).to eq year
      end
    end

    context 'car was not update' do
      let(:year) { 2025 }

      it ' car does not update in db' do
        patch :update, params: { id: car.id }.merge(car_params)

        expect(car.reload.year).not_to eq year
      end
    end
  end
  describe 'DELETE #destroy' do
    let!(:car1) { create(:car) }
    let!(:car2) { create(:car) }

    it 'delete car from db' do
      expect do
        delete :destroy, params: { id: car1.id }
      end.to change(Car, :count).from(2).to(1)
    end
  end
end
