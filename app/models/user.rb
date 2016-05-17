class User < ActiveRecord::Base
	validates :email,
	presence: true,
	uniqueness: {case_sensitive: false}

	validates :password, presence: true, on: :create

	has_secure_password

	has_many :job

	def self.authenticate email, password
		User.find_by_email(email).try(:authenticate, password)
	end
end
