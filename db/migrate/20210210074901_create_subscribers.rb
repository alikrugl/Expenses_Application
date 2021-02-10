class CreateSubscribers < ActiveRecord::Migration[6.1]
  def change
    create_table :subscribers do |t|
      t.string :email
      t.string :sub_email

      t.timestamps
    end
  end
end
