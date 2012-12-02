class Opponent < ActiveRecord::Base


	attr_accessible :name :skill_level :home_capacity :domestic :rival

	has_many :matches

	validates :name, :presence =>true 
	validates :skill_level , :presence =>true 
	validates :home_capacity, :presence =>true 
	validates :domestic, :presence =>true 
	validates :rival, :presence =>true 


end
