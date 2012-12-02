class Fan < ActiveRecord::Base

  attr_accessible :name  :email

	has_many :tickets

	validates :name, :presence =>true 
	validates :email, :presence =>true 

	validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info|qa))$/i, :message => "is not a valid format"

end
