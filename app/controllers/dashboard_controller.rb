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
        case payment.payment_type
          when "member"
            case payment.month.to_date.month.to_s
              when "1"
                member_data[0] += payment.amount.to_i.round
                payments_data[0] += 1
              when "2"
                member_data[1] += payment.amount.to_i.round
                payments_data[1] += 1
              when "3"
                member_data[2] += payment.amount.to_i.round
                payments_data[2] += 1
              when "4"
                member_data[3] += payment.amount.to_i.round
                payments_data[3] += 1
              when "5"
                member_data[4] += payment.amount.to_i.round
                payments_data[4] += 1
              when "6"
                member_data[5] += payment.amount.to_i.round
                payments_data[5] += 1
              when "7"
                member_data[6] += payment.amount.to_i.round
                payments_data[6] += 1
              when "8"
                member_data[7] += payment.amount.to_i.round
                payments_data[7] += 1
              when "9"
                member_data[8] += payment.amount.to_i.round
                payments_data[8] += 1
              when "10"
                member_data[9] += payment.amount.to_i.round
                payments_data[9] += 1
              when "11"
                member_data[10] += payment.amount.to_i.round
                payments_data[10] += 1
              when "12"
                member_data[11] += payment.amount.to_i.round
                payments_data[11] += 1
            end
          when "supporter"
            case payment.month.to_date.month.to_s
              when "1"
                supporter_data[0] += payment.amount.to_i.round
                payments_data[0] += 1
              when "2"
                supporter_data[1] += payment.amount.to_i.round
                payments_data[1] += 1
              when "3"
                supporter_data[2] += payment.amount.to_i.round
                payments_data[2] += 1
              when "4"
                supporter_data[3] += payment.amount.to_i.round
                payments_data[3] += 1
              when "5"
                supporter_data[4] += payment.amount.to_i.round
                payments_data[4] += 1
              when "6"
                supporter_data[5] += payment.amount.to_i.round
                payments_data[5] += 1
              when "7"
                supporter_data[6] += payment.amount.to_i.round
                payments_data[6] += 1
              when "8"
                supporter_data[7] += payment.amount.to_i.round
                payments_data[7] += 1
              when "9"
                supporter_data[8] += payment.amount.to_i.round
                payments_data[8] += 1
              when "10"
                supporter_data[9] += payment.amount.to_i.round
                payments_data[9] += 1
              when "11"
                supporter_data[10] += payment.amount.to_i.round
                payments_data[10] += 1
              when "12"
                supporter_data[11] += payment.amount.to_i.round
                payments_data[11] += 1
            end
          when "project"
            case payment.month.to_date.month.to_s
              when "1"
                project_data[0] += payment.amount.to_i.round
                payments_data[0] += 1
              when "2"
                project_data[1] += payment.amount.to_i.round
                payments_data[1] += 1
              when "3"
                project_data[2] += payment.amount.to_i.round
                payments_data[2] += 1
              when "4"
                project_data[3] += payment.amount.to_i.round
                payments_data[3] += 1
              when "5"
                project_data[4] += payment.amount.to_i.round
                payments_data[4] += 1
              when "6"
                project_data[5] += payment.amount.to_i.round
                payments_data[5] += 1
              when "7"
                project_data[6] += payment.amount.to_i.round
                payments_data[6] += 1
              when "8"
                project_data[7] += payment.amount.to_i.round
                payments_data[7] += 1
              when "9"
                project_data[8] += payment.amount.to_i.round
                payments_data[8] += 1
              when "10"
                project_data[9] += payment.amount.to_i.round
                payments_data[9] += 1
              when "11"
                project_data[10] += payment.amount.to_i.round
                payments_data[10] += 1
              when "12"
                project_data[11] += payment.amount.to_i.round
                payments_data[11] += 1
            end
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
