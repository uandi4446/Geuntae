module MembersHelper

	# Returns the Gravatar for the given user.
	def gravater_for(member)
		gravatar_id = Digest::MD5::hexdigest(member.enum)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
		image_tag(gravatar_url, alt:member.enum, class: "gravatar")
	end
end
