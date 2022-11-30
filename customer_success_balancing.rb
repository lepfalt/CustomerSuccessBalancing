require './helpers/serialization_helper.rb'
require './helpers/customer_helper.rb'
require './helpers/association_helper.rb'

class CustomerSuccessBalancing
  include SerializationHelper
  include CustomerHelper
  include AssociationHelper

  def initialize(customer_success, customers, away_customer_success)
    @customer_success = SerializationHelper.serialize_customers(customer_success)
    @customers = SerializationHelper.serialize_customers(customers)
    @away_customer_success = away_customer_success
  end

  # Returns the ID of the customer success with most customers
  def execute
    customers_sorted = CustomerHelper.sort_by_score(@customers)
    customers_success_sorted = CustomerHelper.sort_by_score(get_available_customer_success())

    customers_associated = make_associations(customers_success_sorted, customers_sorted)

    associations_by_cs = generate_grouped_associations_by_cs(customers_associated)

    if(has_a_more_associated_cs?(associations_by_cs))
      return associations_by_cs.first.cs_id
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

  def generate_grouped_associations_by_cs(customers_associated)
    associations_by_cs = SerializationHelper.serialize_associations(
      CustomerHelper.group_by_cs_associated(customers_associated)
    )

    return AssociationHelper.descending_sort_by_customers_count(associations_by_cs)
  end

  def has_a_more_associated_cs?(associations_by_cs)
    if associations_by_cs.count == 1
      return true
    elsif associations_by_cs.count > 1 and 
      associations_by_cs[0].customers.count > associations_by_cs[1].customers.count
      return true
    end
      
    return false
  end
end
