class SpecificationEditingTool
    def initialize(id_flag,dest_flag)
        @Package_ID=""
        @Package_Destination=""
        @id_is_valid=id_flag
        @dest_is_valid=dest_flag
    end

    def setId(id)
        if(@id_is_valid)
            @Package_ID = id
            # print("Editing Tool Set Id : ",@Package_ID,"\n")
        end
    end

    def setDest(dest)
        if(@dest_is_valid)
            @Package_Destination = dest
            # print("Editing Tool Set Destination : ",@Package_Destination,"\n")
        end
    end

    def Verify(id,dest)
        if @id_is_valid == false
          raise 'Package_ID is invalid!'
        elseif @Package_ID != id
          raise 'Package_ID is invalid!'
        end
        
        if @dest_is_valid == false
            raise 'Package_Destination is invalid!'
        elseif Package_Destination != dest
            raise 'Package_Destination is invalid!'
        end
          
        
    end

    def Generate_status()
        if (@id_is_valid) && (@dest_is_valid)
          return true
        elseif (!@id_is_valid)
          raise 'Package_ID is invalid!'
        elseif (!@dest_is_valid)
          raise 'Package_Destination is invalid!'
        end      
    end
    
    def generateShippingSpecification()
        if @dest_is_valid
            specification=ShippingSpecification.new(@Package_Destination)
            specification
        else
            raise 'Editing tool : Destination is inValid ,can not generate shipping_specification' 
        end
    end

    def throw_warning(temp)
        raise temp
    end
  end