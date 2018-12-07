class Switch_controller
    def initialize(temp)
        @switch=temp
    end

    def pass_status()
        if (@switch.empty?)
            return false
        else 
            return true 
        end      
    end
end