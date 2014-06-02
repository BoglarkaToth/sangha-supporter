class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def load_suggestions
  	@buddhists = Buddhist.all
  	suggest = []
  	@buddhists.each do |buddhist|
  		suggest << { label: buddhist['name'], value: buddhist['id'] }
  	end
  	render json: suggest
  end
end
