class Person
    attr_accessor :name, :cash, :account

    def initialize (attrs = {})
        @name = set_owner(attrs[:name])
        @cash = 0
        @account = nil
    end
    
    def set_owner(name)
        
        name == nil ?  missing_owner : name
    end
      
    def missing_owner
        raise "A name is required"
    end
end