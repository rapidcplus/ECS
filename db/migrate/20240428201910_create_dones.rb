class CreateDones < ActiveRecord::Migration[7.0]
  def change
    create_table :dones do |t|
      t.references :item, null: false, foreign_key: true
      t.string :phone_number
      t.datetime :sent_at
      t.string :sender_name

      t.timestamps
    end
  end
end
