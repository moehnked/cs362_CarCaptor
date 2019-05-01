class CreateCar
  attr_accessor :year, :make, :model, :coolness_value, :horsepower, :torque, :weight, :car
  
  def initialize(year: 1, make: "A", model: "B", coolness_value: 1, horsepower: 1, torque: 1, weight: 1)
    @year = year
    @make = make
    @model = model
    @coolness_value = coolness_value
    @horsepower = horsepower
    @torque = torque
    @weight = weight
    @success = false
  end
  
  def success?
    @success
  end
  
  def build
    self.car = Car.new(year: year, make: make, model: model, coolness_value: coolness_value, horsepower: horsepower, torque: torque, weight: weight)
    car.calculate_power_to_weight_ratio
    car
  end
  
  def create
    build
    result = car.save
    @success = result
  end

end