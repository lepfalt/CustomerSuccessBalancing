class Association
    attr_accessor :cs_id, :customers

    def initialize(cs_id, customers)
        @cs_id = cs_id
        @customers = customers
    end
end
