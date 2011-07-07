class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :format_stuff

  def format_stuff
    @pagename = "nil"
  end

#  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

  public
    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end

    def store_location

    end  

    def redirect_back_or_default(notused)
      # This will always be the intention of authlogic method redirects 
      redirect_to '/'
    end

end
