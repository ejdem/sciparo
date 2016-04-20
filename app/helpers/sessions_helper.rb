module SessionsHelper
    # Method executed when new game starts.
    # So User is remembered.
    def log_in(user)
        session[:user_id] = user.id
    end
    # Current user, every one knows
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    # Method executed when game finished.
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
