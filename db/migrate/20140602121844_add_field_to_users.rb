class AddFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :administrator, :string
  end
end
