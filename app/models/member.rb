require 'bcrypt'

class Member < ActiveRecord::Base
	has_many :time_data
	before_save	{ self.enum = enum }
	before_create	:create_remember_token

	validates_confirmation_of :password
	validates :enum, :presence => true
	validates :name, :presence => true
	validates :birth, :presence => true

	has_secure_password

	# Saving token information when member is created.
	def Member.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def Member.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private
		def create_remember_token
			self.remember_token = Member.encrypt(Member.new_remember_token)
		end

end
