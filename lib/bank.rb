class Bank
    attr_reader :name, :city

    @@all = []

    def initialize(name, city)
        @name = name
        @city = city
        @@all << self
    end

    def accounts 
        Account.all.map {|account| account.bank == self ? account.number : nil}.compact
    end 

    def customers 
        Account.all.map {|account| account.bank == self ? account.customer.name : nil}.compact.uniq 
    end 

    def new_account(number, balance, customer)
        Account.new(number, balance, self, customer)
    end 

    def oldest_account 
        oldest = Account.all.min_by {|account| account.open_year}
        oldest.number 
    end 

    def self.most_customers 
        list_of_bank = Account.all.map {|account| account.bank.name}
        most_popular = list_of_bank.max_by {|i| list_of_bank.count(i)}
        num_of_customers = list_of_bank.count(most_popular)
        p "#{most_popular} Bank has #{num_of_customers} customers."
    end 

    def self.customer_count 
        result = Account.all.map {|account| account.bank.name}
        final_result = result.reduce(Hash.new(0)) {|h, c| h[c] += 1; h}
    end 

    def average_customer_age
        # Account.all.reduce(0) {|sum, age| sum += age }
        list_of_ages = Account.all.map {|account| account.bank == self ? account.customer.age : nil}.uniq.compact 
        list_of_ages.reduce(0) {|sum, age| sum + age}.to_f/list_of_ages.length 
    end 

    def self.most_branches 
        list_of_banks = Bank.all.map {|bank| bank.name}
        most_branches = list_of_banks.max_by {|i| list_of_banks.count(i)}
    end 

    def self.all
        @@all
    end

    
end 

