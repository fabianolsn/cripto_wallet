class WelcomeController < ApplicationController
  
  def index
    @nome = params[:nome]
    cookies[:curso] = "Ruby on Rails [COOKIES]" 
    session[:curso] = "Ruby on Rails [SESSION]"
  end
end
