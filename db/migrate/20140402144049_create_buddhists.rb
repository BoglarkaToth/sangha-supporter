class CreateBuddhists < ActiveRecord::Migration[4.2]
  def change
    create_table :buddhists do |t|
      t.string :status
      t.string :name
      t.string :email
      t.integer :buzzer_id
      t.string :telephone_number
      t.boolean :program_sms
      t.string :address
      t.string :local_center

      t.timestamps
    end
  end
end
