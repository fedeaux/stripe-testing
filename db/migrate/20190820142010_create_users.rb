class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :stripe_customer_id
      t.string :stripe_card_id

      t.timestamps
    end
  end
end
