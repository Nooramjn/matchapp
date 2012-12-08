class Match < ActiveRecord::Base

	attr_accessible :match_type, :home, :opponent_id
	has_many :tickets
	belongs_to :opponent

	validates :home , :presence =>true 
	validates :opponent_id, :presence =>true 



	match_type_list = [['Premier League','PL'], ['Champions League', 'CL'],['Europe League', 'EL'], ['League Cup', 'LC'], ['FA Cup', 'FA']]

	validates_inclusion_of :match_type, :in => %[PL CL EL LC FA ], 
	:message => "is not an option", :allow_nil => true, :allow_blank => true

end
