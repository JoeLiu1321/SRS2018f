Feature: Correct Queue model

  As the correct bin observer
  I want my queue no overflow and routed to the correct bin
  So that Specification Generator generate specification to Switch controller 
  And Switch controller send the command to Switch
  And Switch dispatch the package to correct bin through Pipe_Queue
  
  Scenario Outline:Dispatch the package to correct bin
    Given the package arrive Reading station
      And the Reading station read Package_ID <Package_ID>
      And the Reading station read Package_Destination <Package_Destination>
      And the Reading station send Package_ID <Package_ID> and Package_Destination <Package_Destination> to the Specification Editing tool
      And the Specification Editing tool verify Package_ID is <Package_ID> and Package_Destination is <Package_Destination>
      And the Specification Editing tool generate Shipping_specification
      And Shipping_specification pass to Switch controller
     When Switch controller send the command to Switch
      And Pipe_Queue package "1" don't reach the upper limit
     Then Switch should dispatch the package to correct bin through Pipe_Queue
      And Current_bin <Current_bin> should equal to Shipping_specification

  Examples:
    |Package_ID|Package_Destination|Current_bin |
    |   '1722' |       'HK'        |   'bin1'  |
    |   '1723' |       'TW'        |   'bin2'  |
    |   '1989' |       'UK'        |   'bin3'  |
    |   '2088' |       'US'        |   'bin4'  |
    |   '9999' |       'SP'        |   'bin5'  |
  
  Scenario:Package_ID is invalid
    Given the package arrive Reading station
      And the Reading station read Package_ID "LAB1321"
      And the Reading station read Package_Destination "TW"
      And the Reading station send Package_ID "LAB1321" and Package_Destination "TW" to the Specification Editing tool
     When the Specification Editing tool verify Package_ID is "LAB1321" and Package_Destination is "TW"
      And the Package_ID "LAB1321" is invalid
     Then Specification Editing tool reject the package information
      And Specification Editing tool throw a warning "Package_ID is invalid!"

  Scenario:Package_Destination is invalid
    Given the package arrive Reading station
      And the Reading station read Package_ID "1722"
      And the Reading station read Package_Destination "Chinese Taipei"
      And the Reading station send Package_ID "1722" and Package_Destination "Chinese Taipei" to the Specification Editing tool
     When the Specification Editing tool verify Package_ID is "1722" and Package_Destination is "Chinese Taipei"
      And the Package_Destination "Chinese Taipei" is invalid 
     Then Specification Editing tool reject the package information
      And Specification Editing tool throw a warning "Package_Destination is invalid!"  

  Scenario:Pipe_Queue reach the upper limit
    Given the package arrive Reading station
      And the Reading station read Package_ID "1722"
      And the Reading station read Package_Destination "TW"
      And the Reading station send Package_ID "1722" and Package_Destination "TW" to the Specification Editing tool
      And the Specification Editing tool verify Package_ID is "1722" and Package_Destination is "TW"
      And the Specification Editing tool generate Shipping_specification
      And Shipping_specification pass to Switch controller
     When Switch controller send the command to Switch
      And Pipe_Queue package "3" reach the upper limit
     Then Switch Suspend the package transmission until Pipe_Queue exist free position 

  Scenario:Shipping_specification is invalid
    Given the package arrive Reading station
      And the Reading station read Package_ID "1321"
      And the Reading station read Package_Destination "HK"
      And the Reading station send Package_ID "1321" and Package_Destination "HK" to the Specification Editing tool
      And the Specification Editing tool verify Package_ID is "1321" and Package_Destination is "HK"
      And the Specification Editing tool generate Shipping_specification
      And Shipping_specification pass to Switch controller
     When Switch controller verify "Shipping_specification"
      And Shipping_specification is invalid
     Then Switch controller throw a warning "Shipping_specification is invalid!"