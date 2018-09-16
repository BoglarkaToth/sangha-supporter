class AddFieldToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :administrator, :string
  end
end
