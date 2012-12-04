class Match < ActiveRecord::Base

	attr_accessible :match_type, :home, :opponent_id
	has_many :tickets
	belongs_to :opponent
	validates :match_type, :presence =>true 
	validates :home , :presence =>true 
	validates :opponent_id, :presence =>true 

end
