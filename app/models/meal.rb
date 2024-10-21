class Meal
  attr_accessor :id
  attr_accessor :name, :price

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @name = attributes[:name] # string
    @price = attributes[:price] # integer
  end
end
