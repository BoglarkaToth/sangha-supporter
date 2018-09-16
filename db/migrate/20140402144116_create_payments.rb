class CreatePayments < ActiveRecord::Migration[4.2]
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.datetime :month
      t.string :currency
      t.string :payment_type
      t.string :payment_method
      t.string :comment
      t.boolean :library_member
      t.boolean :bicycle_member
      t.boolean :gym_member
      t.boolean :parking_motorbike
      t.boolean :parking_car
      t.belongs_to :buddhist, index: true

      t.timestamps
    end
  end
end
