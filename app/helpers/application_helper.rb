module ApplicationHelper
	def title
	base_title = "Manchester United FC"
	if @title.nil?
		base_title
	else
		" Manchester United FC | #{@title}"
    end
    end

    def admin_fan
      if current_fan && current_fan.admin
       return true 
      else 
      	return false
      end
    end
end
