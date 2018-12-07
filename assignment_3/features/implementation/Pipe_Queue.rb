class Pipe_Queue
    def initialize()
        @limit = 2
        @current_package_num = 0
    end

    def limit(temp)
        if (temp.to_i)  > @limit
            @current_package_num = 2
            raise 'Pipe_Queue reach the upper limit'
        end
        
        @current_package_num = temp
        return true
    end 

    def free_position()
      if (@current_package_num < 2)
        return true
      else 
        # 呼叫一次 free_position() @current_paclage_num要減少表示de queue
        @current_package_num= @current_package_num -1
        return false
      end
    end
    
end 