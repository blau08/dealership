require('rspec')
require('dealership')
require('car')

# describe(Dealership) do
  # before() do
  #   Dealership.clear()
  # end

  describe('#name') do
    it('returns the name of the dealership') do
      test_dealership = Dealership.new("Euro Motorz")
      expect(test_dealership.name()).to(eq("Euro Motorz"))
    end
  end

  describe("#id") do
    it("returns the id of the dealership") do
      test_dealership = Dealership.new("Euro Motorz")
      expect(test_dealership.id()).to(eq(1))
    end
  end

  describe("#cars") do
    it("initially returns an empty array of cars for dealership") do
      test_dealership = Dealership.new("Euro Motorz")
      expect(test_dealership.cars()).to(eq([]))
    end
  end

  describe('.all') do
    it("is empty at first") do
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("adds a dealership to the array of saved dealerships") do
      test_dealership = Dealership.new("Euro Motorz")
      test_dealership.save()
      expect(Dealership.all()).to(eq([test_dealership]))
    end
  end

  describe(".clear") do
    it("empties all saved dealerships") do
      Dealership.new("Euro Motorz").save()
      Dealership.clear()
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a dealership by its id number") do
      test_dealership = Dealership.new("Euro Motorz")
      test_dealership.save()
      test_dealership2 = Dealership.new("Mr Lau's Cars Showroom")
      test_dealership2.save()
      expect(Dealership.find(test_dealership.id())).to(eq(test_dealership))
    end
  end

  describe('#add_car') do
    it("adds a new car to a dealership") do
      test_dealership = Dealership.new("Euro Motorz")
      test_car = Car.new("Audi", "Q5", 2015)
      test_dealership.add_car(test_car)
      expect(test_dealership.cars()).to(eq([test_car]))
    end
  end
