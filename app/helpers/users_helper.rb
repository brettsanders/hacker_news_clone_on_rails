module UsersHelper
  def current_user
    @_current_user ||= User.find(session[:id]) if session[:id]
  end
end
