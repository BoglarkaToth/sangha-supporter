json.array!(@buddhists) do |buddhist|
  json.extract! buddhist, :id, :status, :name, :email, :buzzer_id, :telephone_number, :program_sms, :address, :local_center
  json.url buddhist_url(buddhist, format: :json)
end
