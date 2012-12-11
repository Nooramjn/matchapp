class Ticket < ActiveRecord::Base

	attr_accessible :quantity, :ticket_type, :fan_id, :match_id

	belongs_to :fan
	belongs_to :match

	validates :quantity , :presence =>true 
	validates :fan_id, :presence =>true 
	validates :match_id, :presence =>true 


	TICKET_TYPE_LIST = [['VIP Box'], ['Upper Grandstand'],['Middle Grandstand'], ['Lower Grandstand'], ['Upper Behind Goal'], ['Middle Behind Goal']]

	validates_inclusion_of :ticket_type, :in => %["VIP Box" Upper Grandstand" "Middle Grandstand" "Lower Grandstand" "Upper Behind Goal" "Middle Behind Goal"],
	:message => "is not an option", :allow_nil => true, :allow_blank => true


end


