module SessionHelper

	# When log in, making session token and saving to cookie
	def sign_in(member)
		remember_token = Member.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		member.update_attribute(:remember_token, Member.encrypt(remember_token))
		self.current_member = member
	end

	# checking whether login or not
	def signed_in?
		!current_member.nil?
	end

	# saving member information for the other pages
	def current_member=(member)
		@current_member = member
	end

	# Using token which is stored at cookie.
	def current_member
		remember_token = Member.encrypt(cookies[:remember_token])
		@current_member ||= Member.find_by(remember_token: remember_token)
	end

	def sign_out
		self.current_member = nil
		cookies.delete(:remember_token)
	end
end
