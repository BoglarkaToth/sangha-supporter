class AddBuddhistRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :buddhist, foreign_key: true
  end
end
