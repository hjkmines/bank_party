class Customer
    
    attr_reader :name 
    attr_accessor :age 
    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def accounts 
        Account.all.select {|account| account.customer == self ? account.bank : nil}
    end 
   
    def banks
        Account.all.map {|account| account.customer == self ? account.bank.name : nil}.compact.uniq  
    end 

    def new_account(number, balance, bank)
        Account.new(number, balance, bank, self)
    end 

    def self.average_number_of_accounts 
        list_of_customers = Account.all.map {|account| account.customer.name}
        avg = list_of_customers.length.to_f/list_of_customers.uniq.length
    end 

end