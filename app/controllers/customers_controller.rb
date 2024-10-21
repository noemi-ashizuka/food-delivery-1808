require_relative "../views/customer_view"
require_relative "../models/customer"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customer_view = CustomerView.new
  end

  def list
    display_customers
  end

  def add
    # ask the user for the customer name and store it
    name = @customer_view.ask_for("name")
    # ask the user for the customer address and store it
    address = @customer_view.ask_for("address")
    # create a new customer instance
    customer = Customer.new(name: name, address: address)
    # ask the repository to store the instance
    @customer_repository.create(customer)
  end

  def edit
	  display_customers
	  index = @customer_view.ask_for('number').to_i - 1
	  customer = @customer_repository.all[index]
	  customer.name = @customer_view.ask_for('new name')
	  customer.address = @customer_view.ask_for('new address')
	  @customer_repository.update
	end

	def destroy
	  display_customers
	  index = @customer_view.ask_for('number').to_i - 1
	  @customer_repository.destroy(index)
	end

  private

  def display_customers
    # get the customers from the repository
    customers = @customer_repository.all
    # give the customers to the view to display them
    @customer_view.display(customers)
  end
end
