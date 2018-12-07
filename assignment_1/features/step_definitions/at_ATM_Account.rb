require "matrix"

Given("the account balance is ${int}") do |arg|
  @Account_item = Account.new(arg)
  end
  
  Given("the ATM contains ${int}") do |arg|
    @ATM_item = ATM.new(arg)
  end
  
  When("the customer withdraw ${int}") do |arg|
    begin
      @Account_item.subCoda(arg)
    rescue Exception => @exception
    end

    begin
      @ATM_item.subCoda(arg)
    rescue Exception => @exception
    end

  end
  
  Then("the account balance should be ${int}") do |arg|
    expect(@Account_item.showCoda()).to eq(arg.to_i)
  end
  
  Then("the ATM should contains ${int}") do |arg|
    expect(@ATM_item.showCoda()).to eq(arg.to_i)
  end

  Then("the error message should be {string}") do |msg|
    expect(@exception.message).to eq(msg)
  end