class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
  	if current_user.admin == true
      root_path
    else
  		new_user_daily_report_path(current_user.id)
  	end
  end

  protected

	  def devise_parameter_sanitizer
	  	if resource_class == User
	  		User::ParameterSanitizer.new(User, :user, params)
	  	else
	  		super # Use the default one
	    end
	  end
end
