class DashboardController < ApplicationController
  def index
    @report_year = params[:year]
  end

  def monthly_income_data
    year = params[:year] ? params[:year] : 2014
  	@payments = Payment.where(:currency => "huf")
  	member_data = [0,0,0,0,0,0,0,0,0,0,0,0]
    supporter_data = [0,0,0,0,0,0,0,0,0,0,0,0]
    project_data = [0,0,0,0,0,0,0,0,0,0,0,0]
    payments_data = [0,0,0,0,0,0,0,0,0,0,0,0]
    data = {}
  	@payments.each do |payment|
      if payment.month.to_date.year.to_s === year.to_s
        index = payment.month.to_date.month.to_i - 1
        case payment.payment_type
            when "member"
                member_data[index] += payment.amount.to_i.round
                payments_data[index] += 1
            when "supporter"
                supporter_data[index] += payment.amount.to_i.round
                payments_data[index] += 1
            when "project"
                project_data[index] += payment.amount.to_i.round
                payments_data[index] += 1
        end
      end
    end
    data["member_data"] = member_data
    data["supporter_data"] = supporter_data
    data["payments_data"] = payments_data
    data["project_data"] = project_data
  	render json: data
  end
end
