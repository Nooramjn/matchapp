class Match < ActiveRecord::Base

	attr_accessible :match_type, :home, :opponent_id
	has_many :tickets
	belongs_to :opponent

	validates :opponent_id, :presence =>true 



	MATCH_TYPE_LIST = [['Premier League'], ['Champions League'],['Europe League'], ['League Cup'], ['FA Cup']]

	validates_inclusion_of :match_type, :in => %["Premier League" "Champions League" "Europe League" "League Cup" "FA Cup" ], 
	:message => "is not an option", :allow_nil => true, :allow_blank => true

end
