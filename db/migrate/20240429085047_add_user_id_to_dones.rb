class AddUserIdToDones < ActiveRecord::Migration[7.0]
  def change
    add_reference :dones, :user, null: false, foreign_key: true
  end
end
