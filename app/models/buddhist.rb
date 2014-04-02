class Buddhist < ActiveRecord::Base
	has_many :payments, dependent: :destroy
end
