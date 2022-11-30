module AssociationHelper
    def AssociationHelper.descending_sort_by_customers_count(associations)
        return associations.sort { |e1,e2| e2.customers.count <=> e1.customers.count }
    end
end
