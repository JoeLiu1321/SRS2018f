class ATM
    def initialize(money)
        @ATM_money = money
    end
  
    def showCoda
        @ATM_money
    end
    
    def subCoda(withdrawMoney)
        if withdrawMoney >   @ATM_money
          raise 'ATM does not have enough money'
        end
        
          @ATM_money = @ATM_money - withdrawMoney
        
    end
  end