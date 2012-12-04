class Fan < ActiveRecord::Base

<<<<<<< HEAD
attr_accessible :name, :email
before_save { |fan| fan.email = email.downcase }

validates :name, presence: true, length: { maximum: 50 }

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

=======
  attr_accessible :name, :email

	has_many :tickets

	validates :name, :presence =>true 
	validates :email, :presence =>true 

	validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info|qa))$/i, :message => "is not a valid format"
>>>>>>> caef50d6189932efe9023f78d9c68904a867ac20

end
