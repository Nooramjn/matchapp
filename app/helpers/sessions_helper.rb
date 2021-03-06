module SessionsHelper
	def sign_in(fan)
    cookies.permanent[:remember_token] = fan.remember_token
    self.current_fan= fan
  end

  def signed_in?
    !current_fan.nil?
  end


  def current_fan=(fan)
    @current_fan= fan
  end


	def current_fan
    @current_fan ||= Fan.find_by_remember_token(cookies[:remember_token])
    end
	def current_fan?(fan)
    fan.id == current_fan.id
  	end



	def sign_out
    logger.debug "SIGNOUT HAS BEEN CALLED"
    self.current_fan= nil
    logger.debug "The current fan is #{current_fan.email}"
    cookies.delete(:remember_token)
  end
  
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end

end
