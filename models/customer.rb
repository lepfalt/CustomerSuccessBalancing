class Customer
    attr_accessor :id, :score, :cs_associated

    def initialize(id, score)
        @id = id
        @score = score
    end

    def associate(cs_associated)
        @cs_associated = cs_associated
    end
end
