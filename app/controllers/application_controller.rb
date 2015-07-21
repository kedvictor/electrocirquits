class ApplicationController < ActionController::Base
 
  protect_from_forgery with: :exception
  
  def authenticate
    authentication_text = 'Administration password required. Please enter username && password.'
    authenticate_or_request_with_http_basic(authentication_text) do |username, password|
      md5_of_password = Digest::MD5.hexdigest(password)
      login = Variable.find_by_key 'login'
      password = Variable.find_by_key 'password'
      username == (login ? login.value : 'victor') && 
        md5_of_password == (password ? password.value : "c31f554d04b62050782143c540ab1941")
    end
  end
  
  
end
