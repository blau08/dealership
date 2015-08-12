require('rspec')
require('car')
require('pry')

describe('Car') do

    before() do
      Car.clear()
    end

  describe("#make") do
    it("returns the make of the car") do
      test_car = Car.new("Audi", "Q5", 2015)
      test_car.save()
      expect(test_car.make()).to(eq("Audi"))
    end
  end

  describe("#model") do
    it("returns the model of the car") do
      test_car = Car.new("Audi", "Q5", 2015)
      test_car.save()
      expect(test_car.model()).to(eq("Q5"))
    end
  end

  describe("#year") do
    it("returns the year of the car") do
      test_car = Car.new("Audi", "Q5", 2015)
      expect(test_car.year()).to(eq(2015))
    end
  end

  describe("#id") do
    it("returns the id of a car") do
      test_car = Car.new("Audi", "Q5", 2015)
      test_car.save()
      expect(test_car.id()).to(eq(1))
    end
  end

  describe("#save") do
    it("adds a car to the array of saved cars") do
      test_car = Car.new("Audi", "Q5", 2015)
      test_car.save()
      expect(Car.all()).to(eq([test_car]))
    end
  end

  describe(".find") do
    it('returns the car by its id number') do
      test_car = Car.new("Audi", "Q5", 2015)
      test_car.save()
      test_car2 = Car.new("Audi", "Q7", 2014)
      test_car2.save()
      expect(Car.find(test_car.id())).to(eq(test_car))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Car.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties all of the saved cars") do
      Car.new("Audi", "Q5", 2015).save()
      Car.clear()
      expect(Car.all()).to(eq([]))
    end
  end

  describe("#age") do
    it("returns the car age") do
      test_car = Car.new("Audi", "Q5", 2015)
      expect(test_car.age).to(eq(0))
    end
  end

  describe("#worth_buying?") do
    it("check if the car is European and not older than 10 years") do
      test_car = Car.new("Audi", "Q5", 2015)
      expect(test_car.worth_buying?()).to(eq(true))
    end
  end

end
