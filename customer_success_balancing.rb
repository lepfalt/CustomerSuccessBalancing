require './helpers/serialization_helper.rb'
require './helpers/customer_helper.rb'

class CustomerSuccessBalancing
  include SerializationHelper
  include CustomerHelper

  def initialize(customer_success, customers, away_customer_success)
    @customer_success = SerializationHelper.serialize_customers(customer_success)
    @customers = SerializationHelper.serialize_customers(customers)
    @away_customer_success = away_customer_success
  end

  # Returns the ID of the customer success with most customers
  def execute
    avaiable_customers_success = get_available_customer_success()

    customers_ordened = CustomerHelper.sort_by_score(@customers)
    customers_success_ordened =  CustomerHelper.sort_by_score(avaiable_customers_success)

    customers_associated = make_associations(customers_success_ordened, customers_ordened)

    associations_aggrupment = generate_grouped_associations(customers_associated)

    if(cs_associated_more_often?(associations_aggrupment))
      return associations_aggrupment.first.cs_id
    end
    
    return 0
  end

  private

  def get_available_customer_success()
    return @customer_success.delete_if { |cs| @away_customer_success.include?(cs.id) }
  end

  def make_associations(customers_success, customers)
    customers_associated = []

    customers.each do |customer|
      customer_success_associated = customers_success.find { |cs| cs.score >= customer.score }

      if customer_success_associated != nil
        customer.associate(customer_success_associated.id)
        customers_associated.append(customer)
      end
    end

    return customers_associated
  end

  def generate_grouped_associations(customers_associated)
    aggrupment = CustomerHelper.group_by_cs_associated(customers_associated)
    associations = SerializationHelper.serialize_associations(aggrupment)
    return associations.sort { |e1,e2| e2.customers.count <=> e1.customers.count }
  end

  def cs_associated_more_often?(associations_aggrupment)
    if associations_aggrupment.count == 1
      return true
    elsif associations_aggrupment.count > 1 and 
      associations_aggrupment[0].customers.count > associations_aggrupment[1].customers.count
      return true
    end

    return false
  end
end
