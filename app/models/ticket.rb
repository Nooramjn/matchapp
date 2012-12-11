class Ticket < ActiveRecord::Base

	attr_accessible :quantity, :ticket_type, :fan_id, :match_id

	belongs_to :fan
	belongs_to :match

	validates :quantity , :presence =>true 
	validates :fan_id, :presence =>true 
	validates :match_id, :presence =>true 


	TICKET_TYPE_LIST = [['Premier League Ticket'], ['Champions League Ticket'],['Europe League Ticket'], ['League Cup Ticket'], ['FA Cup Ticket']]

	validates_inclusion_of :ticket_type, :in => %["Premier League Ticket" "Champions League Ticket" "Europe League Ticket" "League Cup Ticket" "FA Cup Ticket"],
	:message => "is not an option", :allow_nil => true, :allow_blank => true


end


