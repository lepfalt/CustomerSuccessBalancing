module CustomerHelper
    def CustomerHelper.sort_by_score(customers)
        return customers.sort_by{|c| c.score} 
    end

    def CustomerHelper.group_by_cs_associated(customers_associated)
        return customers_associated.group_by { |customer| customer.cs_associated }
    end
end
