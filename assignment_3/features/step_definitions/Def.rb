require "matrix"
Given("the package arrive Reading station") do
  @station=ReadingStation.new()
end

Given("the Reading station read Package_ID {string}") do |string|
  @station.readId(string)
end

Given("the Reading station read Package_Destination {string}") do |string|
  @station.readDest(string)
end

Given("the Reading station send Package_ID {string} and Package_Destination {string} to the Specification Editing tool") do |string, string2|
  @editing_tool=SpecificationEditingTool.new(@station.isIdValid(),@station.isDestValid())
  @editing_tool.setId(string)
  @editing_tool.setDest(string2)
end

Given("the Specification Editing tool verify Package_ID is {string} and Package_Destination is {string}") do |string, string2|
  begin
    @editing_tool.Verify(string,string2)
    rescue Exception => @exception
  end
end

Given("the Specification Editing tool generate Shipping_specification") do
  @specification=@editing_tool.generateShippingSpecification()
  @editing_tool.Generate_status()
end

Given("Shipping_specification pass to Switch controller") do
  
  @specification.pass_status()
end

When("Switch controller send the command to Switch") do
  @pass_or_reject=Pass_OR_Reject_step.new()
  @pass_or_reject.pass()
end

When("Pipe_Queue package {string} don't reach the upper limit") do |string|
  begin
    @pipe_queue = Pipe_Queue.new()
    @pipe_queue.limit(string)
  rescue Exception => @exception
  end
end

When("Pipe_Queue package {string} reach the upper limit") do |string|
  begin
    @pipe_queue = Pipe_Queue.new()
    @pipe_queue.limit(string)
  rescue Exception => @exception
  end
end

Then("Switch should dispatch the package to correct bin through Pipe_Queue") do
  @pass_or_reject.pass()
end

Then("Current_bin {string} should equal to Shipping_specification") do |string|
  if ( not string.eql? @specification.getSpecification() )
    raise "Current_bin not equal to Shipping_specification"
  end
  
  # puts(@specification.getSpecification())
end

When("the Package_ID {string} is invalid") do |string|
  @pass_or_reject=Pass_OR_Reject_step.new()
  @pass_or_reject.reject()
end

Then("Specification Editing tool reject the package information") do
  @pass_or_reject=Pass_OR_Reject_step.new()
  @pass_or_reject.reject()
end

Then("Specification Editing tool throw a warning {string}") do |string|
  begin
    @editing_tool.throw_warning(string)
  rescue Exception => @exception
  end
end

When("the Package_Destination {string} is invalid") do |string|
  @pass_or_reject=Pass_OR_Reject_step.new()
  @pass_or_reject.reject()
end

Then("Switch Suspend the package transmission until Pipe_Queue exist free position") do
  temp = @pipe_queue.free_position()
  while (!temp)
    if ( temp )
      @pass_or_reject.pass()
    end
    temp = @pipe_queue.free_position()
  end
end

When("Switch controller verify {string}") do |string|
  @switch_controller=Switch_controller.new(string)
  @switch_controller.pass_status()
end

When("Shipping_specification is invalid") do
  @specification=ShippingSpecification.new("")
  @specification.pass_status()
end

Then("Switch controller throw a warning {string}") do |string|
  begin
    @switch_controller.throw_warning(string)
  rescue Exception => @exception
  end
end