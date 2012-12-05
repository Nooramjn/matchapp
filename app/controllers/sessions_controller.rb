class SessionsController < ApplicationController

	def new
  	end

  	def create
  		fan = Fan.find_by_email(params[:session][:email].downcase)
    if fan && fan.authenticate(params[:session][:password])
      sign_in fan
      redirect_to fan
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  	end

  	def destroy
      logger.debug "Signing out #{current_fan.email}"
  		sign_out
    	redirect_to root_url
  	end
end
