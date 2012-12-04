class Ticket < ActiveRecord::Base

	attr_accessible :quantity, :ticket_type, :fan_id, :match_id

	belongs_to :fan
	belongs_to :match

	validates :quantity , :presence =>true 
	validates :ticket_type , :presence =>true 
	validates :fan_id, :presence =>true 
	validates :match_id, :presence =>true 
end
