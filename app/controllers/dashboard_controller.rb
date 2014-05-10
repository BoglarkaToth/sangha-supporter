class DashboardController < ApplicationController
  def index
  end

  def monthly_income_data
  	data = []
  	series = []
  	@payments = Payment.where("payment_type = ? AND currency = ?", "member", "huf").order('month asc')
  	member = Hash.new
  	member["name"] = 'member'
  	member["data"] = Array.new
  	@payments.each do |payment|
      case payment.month
      when 
  		member["data"].push << [payment['month'] => payment['amount']]
  	end
  	series << member
  	data << series
  	render json: data
  end
end
