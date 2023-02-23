# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Car.create(make: 'Ford', model: 'Mustang', year: 2019, odometer: 84_224, price: 26_976, description: '4x4-wheel drive',
           date_added: '2022-12-10')
Car.create(make: 'BMW', model: 'X3', year: 2012, odometer: 32_876, price: 35_250, description: 'FWD',
           date_added: '2013-05-02')
Car.create(make: 'Honda', model: 'CR-V', year: 2021, odometer: 14_608, price: 93_200, description: 'RWD',
           date_added: '2012-01-22')
Car.create(make: 'Lincoln', model: 'Navigator', year: 2022, odometer: 15_150, price: 96_000, description: 'FWD',
           date_added: '2023-05-24')

# Cars.create(make: '', model: '', year: , odometer: , price:, description: '')
