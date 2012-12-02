class Ticket < ActiveRecord::Base

	attr_accessible :quantity :type :fan_id :match_id

	belong_to :fans
	belong_to :matches

	validates :quantity , :presence =>true 
	validates :type , :presence =>true 
	validates :fan_id, :presence =>true 
	validates :match_id, :presence =>true 


end
