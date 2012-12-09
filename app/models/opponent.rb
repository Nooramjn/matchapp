class Opponent < ActiveRecord::Base


	attr_accessible :name, :skill_level, :home_capacity, :domestic, :rival

	has_many :matches

	validates :name, :presence =>true 
	validates :home_capacity, :presence =>true 
	validates :domestic, :presence =>true 
	validates :rival, :presence =>true 


	skill_level_list = [['Elite'], ['Moderate'], ['Underdog']]

	validates_inclusion_of :skill_level, :in => %[Elite Moderate Underdog], 
	:message => "is not an option", :allow_nil => true, :allow_blank => true

end
