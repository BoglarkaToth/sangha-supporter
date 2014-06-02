class Buddhist < ActiveRecord::Base
	has_paper_trail
	has_many :payments, dependent: :destroy
end
