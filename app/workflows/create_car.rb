class CreateCar
  attr_accessor :year, :make, :model, :coolness_value, :car
  
  def initialize(year: 1, make: "A", model: "B", coolness_value: 1)
    @year = year
    @make = make
    @model = model
    @coolness_value = coolness_value
    @success = false
  end
  
  def success?
    @success
  end
  
  def build
    self.car = Car.new(year: year, make: make, model: model, coolness_value: coolness_value)
    car
  end
  
  def create
    build
    result = car.save
    @success = result
  end

end