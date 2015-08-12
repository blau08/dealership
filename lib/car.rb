class Car
  @@cars = []

  define_method(:initialize) do |make, model, year|
    @make = make
    @model = model
    @year = year
    @id = @@cars.length().+1
  end

  define_method(:make) do
    @make
  end

  define_method(:model) do
    @model
  end

  define_method(:year) do
    @year
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |identification|
    found_car = nil
    @@cars.each do |car|
      if car.id().eql?(identification.to_i())
        found_car = car
      end
    end
    found_car
  end

  define_singleton_method(:all) do
    @@cars
  end

  define_method(:save) do
    @@cars.push(self)
  end

  define_singleton_method(:clear) do
    @@cars = []
  end

  define_method(:age) do
    current_year = Time.new().year()
    age = current_year.-(@year)
  end

  define_method(:worth_buying?) do
    european_cars = ["Audi", "BMW", "VW"]
    european_cars.include?(@make).&(self.age<=(10))
  end

end
