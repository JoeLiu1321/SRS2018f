Feature: ATM withdraw
    Scenario Outline: withdraw money in normal case

        Given the account balance is $<Account_init>
          And the ATM contains $<ATM_init>
         When the customer withdraw $<Withdraw_money>
         Then the account balance should be $<Account_balance>
          And the ATM should contains $<ATM_balance>

    Examples:
    |  Account_init   |  ATM_init   |  Withdraw_money   |  Account_balance  |  ATM_balance |
    |  1200           | 10000       | 1200              |   0               |   8800       |
    |  1000           | 20000       | 800               |   200             |   19200      |

    Scenario: normal case - withdraw all money

        Given the account balance is $100
          And the ATM contains $10000
         When the customer withdraw $100
         Then the account balance should be $0
          And the ATM should contains $9900

    Scenario: normal case - withdraw a prt of money

        Given the account balance is $1000
          And the ATM contains $10000
         When the customer withdraw $100
         Then the account balance should be $900
          And the ATM should contains $9900

    Scenario: exceptional case - account does not have enough money

        Given the account balance is $100
          And the ATM contains $10000
         When the customer withdraw $200
         Then the error message should be 'account does not have enough money'

    Scenario: exceptional case - ATM does not have enough money

        Given the account balance is $100
          And the ATM contains $0
         When the customer withdraw $100
         Then the error message should be 'ATM does not have enough money'