require './models/customer.rb'
require './models/association.rb'

module SerializationHelper
    def SerializationHelper.serialize_customers(customers)
        customer_list = []
        customers.each do |customer|
            customer_list.append(Customer.new(customer[:id], customer[:score]))
        end

        return customer_list
    end

    def SerializationHelper.serialize_associations(associations_aggrupment)
        associations_list = []
        associations_aggrupment.each do |association|
            associations_list.append(Association.new(association.first, association.last))
        end

        return associations_list
    end
end
