module FansHelper
    def admin_fan
      if current_fan && current_fan.admin
       return true 
      else 
      	return false
      end
    end
end
