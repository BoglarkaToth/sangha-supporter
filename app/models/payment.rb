class Payment < ActiveRecord::Base
  has_paper_trail
  belongs_to :buddhist
end
