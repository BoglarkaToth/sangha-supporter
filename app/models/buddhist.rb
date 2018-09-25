class Buddhist < ActiveRecord::Base
	has_many :payments, dependent: :destroy
	belongs_to :user, optional: true

	def self.search_by_name(query)
		where("name like ?", "%#{query}%")
	end
end
