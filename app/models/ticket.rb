class Ticket < ActiveRecord::Base

	attr_accessible :quantity, :ticket_type, :fan_id, :match_id

	belongs_to :fan
	belongs_to :match

	validates :quantity , :presence =>true 
	validates :fan_id, :presence =>true 
	validates :match_id, :presence =>true 


	ticket_type_list = [['Premier League Ticket','PLT'], ['Champions League Ticket', 'CLT'],['Europe League Ticket', 'ELT'], ['League Cup Ticket', 'LCT'], ['FA Cup Ticket', 'FAT']]

	validates_inclusion_of :ticket_type, :in => %[PLT CLT ELT LCT FAT],
	:message => "is not an option", :allow_nil => true, :allow_blank => true


end


