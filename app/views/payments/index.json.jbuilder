json.array!(@payments) do |payment|
  json.extract! payment, :id, :amount, :month, :currency, :payment_type, :payment_method, :comment, :library_member, :bicycle_member, :gym_member, :parking_motorbike, :parking_car, :buddhist_id
  json.url payment_url(payment, format: :json)
end
