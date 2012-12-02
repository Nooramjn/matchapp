class Match < ActiveRecord::Base


	attr_accessible :type :home :opponent_id
	has_many :tickets
	belong_to :opponenets
	
	validates :type, :presence =>true 
	validates :home , :presence =>true 
	validates :opponent_id, :presence =>true 


end
