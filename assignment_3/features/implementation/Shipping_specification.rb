class ShippingSpecification
    def initialize(dest)
        @specification='bin'
        @valid_dest_list=['HK','TW','UK','US','SP','FR','ID','IQ','IT']
        start=1
        # puts(dest)
        case dest 
        when @valid_dest_list[0]
            @specification.concat(start.to_s)
        when @valid_dest_list[1]
            @specification.concat((start+1).to_s)
        when @valid_dest_list[2]
            @specification.concat((start+2).to_s)
        when @valid_dest_list[3]
            @specification.concat((start+3).to_s)
        when @valid_dest_list[4]
            @specification.concat((start+4).to_s)
        when @valid_dest_list[5]
            @specification.concat((start+5).to_s)  
        when @valid_dest_list[6]
            @specification.concat((start+6).to_s)
        when @valid_dest_list[7]
            @specification.concat((start+7).to_s)
        when @valid_dest_list[8]
            @specification.concat((start+8).to_s)  
        else
            @specification=''
        end
    end

    def getSpecification()
        @specification 
    end

    def pass_status()
        if (@specification.empty?)
            return false
        else 
            return true 
        end
    end

end