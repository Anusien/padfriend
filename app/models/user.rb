class User < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 10 }

	VALID_EMAIL_REGEX = \A[\w+\-.]+@[\w+\-.]+\.[\w+\-.]\z/i
	validates :email, presence: true format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

	validates :friendcode, presence: true, uniquenesss: true


	before_save { self.email = email.downcase }
end
