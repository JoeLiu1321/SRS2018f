class ReadingStation
    def initialize()
        @Package_ID=""
        @Package_Destination=""
        @id_is_valid=false
        @dest_is_valid=false
        @valid_id_list=['1722','1723','1989','2088','9999','876','001','7898']
        @valid_dest_list=['HK','TW','UK','US','SP','FR','ID','IQ','IT']
        
    end
    
    def readId(id)
        @id_is_valid = @valid_id_list.include?(id)
        if(@id_is_valid)
            @Package_ID = id
        end
    end

    def readDest(dest)
        @dest_is_valid = @valid_dest_list.include?(dest)
        if(@dest_is_valid)
            @Package_Destination = dest
        end
    end

    def isIdValid()
        @id_is_valid
    end

    def isDestValid()
        @dest_is_valid
    end
end