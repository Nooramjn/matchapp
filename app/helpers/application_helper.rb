module ApplicationHelper
	def title
	base_title = "Manchester United FC"
	if @title.nil?
		base_title
	else
		" Manchester United FC | #{@title}"
end
end
end
