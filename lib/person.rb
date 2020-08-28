require './lib/account'

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

    def create_account
        @account = Account.new(owner:self)
    end

    def deposit(amount)
        @account != nil ? deposit_cash(amount) : no_account_created
    end

    def deposit_cash(amount)
        account.balance= 0
        @account.balance += amount
    end

    def no_account_created
        raise RuntimeError, 'No account present'
    end



end