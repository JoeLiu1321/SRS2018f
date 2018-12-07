class Account
    def initialize(money)
        @account_money = money
      
    end
  
    def showCoda
        @account_money
    end
    
    def subCoda(withdrawMoney)
        if withdrawMoney >    @account_money
          raise 'account does not have enough money'
        end
        
        @account_money =  @account_money - withdrawMoney
        
        
    end

  end