ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Возвращает true, если тестовый пользователь вошел.
  def is_logged_in?
    !session[:user_id].nil?
  end

  def log_in_as
    if integrations_test?
      post login_path, session: { email: user.email
                                  password: password
                                  remember_me: remember_me }
    else 
      session[:user_id] = user_id
  end
end

private
  
  #Возвращает true внутри интергационного теста.
  def integtation_test?
    defined?(post_via_redirect)
  end