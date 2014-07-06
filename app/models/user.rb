class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[\w+\-.]+\.[\w+\-.]+\z/i

	validates :name, presence: true, length: { minimum: 3, maximum: 10 }
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :friendcode, presence: true, uniqueness: true, length: { minimum: 9, maximum: 9 }
	validates :password, length: { minimum: 6 }




	before_save {
		self.email = email.downcase
	}

	has_secure_password
end
