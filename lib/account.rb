class Account
    STANDARD_VALIDITY_YRS = 5

    attr_accessor :pin_code, :balance, :account_status, :exp_date, :owner

    def initialize (attrs = {})
        @pin_code = rand(1000..9999)
        @exp_date = set_expire_date
        @account_status = :active
        set_owner(attrs[:owner])
    end

    private
    def set_owner(obj)
        obj == nil ?  missing_owner : @owner = obj
    end
      
    def missing_owner
        raise "An Account owner is required"
    end

    def set_expire_date
        Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
    end

    def self.deactivate(account)
        account.account_status = :deactivated
    end 
end