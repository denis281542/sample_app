module SessionsHelper

  # Осуществляет вход данного пользователя.
  def log_in(user)
    session[:user_id] = user.id   
  end

  #Запоминает пользователя в постоянном сеансе
  def remember(user)
    user.remember
    cookie.permanent.signed(:user_id) = user.id
    cookie.permanent[:remember_token] = user.remember_token
  end

  # Возвращает текущего вошедшего пользователя (если есть).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Возвращает true, если пользователь зарегистрирован, иначе возвращает false.
  def logged_in?
    !current_user.nil?
  end

  # Осуществляет выход текущего пользователя.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end

