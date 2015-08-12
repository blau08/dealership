require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/car')
require('./lib/dealership')

get('/') do
  erb(:index)
end

get('/dealerships/new') do
   erb(:dealerships_form)
end

get('/dealerships') do
  @dealerships = Dealership.all()
  erb(:dealerships)
end

post('/dealerships') do
  name = params.fetch('name')
  Dealership.new(name).save()
  @dealerships = Dealership.all()
  erb(:successdealer)
end

get('/cars/:id') do
  @car = Car.find(params.fetch("id").to_i())
  erb(:car)
end

get('/dealerships/:id') do
  @dealership = Dealership.find(params.fetch('id').to_i())
  erb(:dealership)
end

get('/dealerships/:id/cars/new') do
    @dealership = Dealership.find(params.fetch('id').to_i())
    erb(:dealership_cars_form)
end

post('/cars') do
  make = params.fetch('make')
  model = params.fetch('model')
  year = params.fetch('year')
  @car = Car.new(make, model, year)
  @car.save()
  @dealership = Dealership.find(params.fetch('dealership_id').to_i())
  @dealership.add_car(@car)
  erb(:success)
end
