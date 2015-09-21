class SessionController < ApplicationController

	# GET /session
	def new
	end

	# POST /session
	def create
  		member = Member.find_by(enum: params[:session][:enum])
  		if member && member.authenticate(params[:session][:password])
  			# Log the user in and redirect to the user's show page.
  			# redirect_to "/time_data/"+params[:session][:enum]
  			# redirect_to '/time_data/' + params[:session][:enum]
        sign_in member
        redirect_to '/time_data/new'
  		else
  			flash[:danger] = "Invalid employ number/password combination"
  			render 'new'
  		end
  	end

  # DELETE /session
 	def destroy
    sign_out
    redirect_to root_path
  end
end
