class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :name , null: false
      t.text :description
      t.string :category, default: "Others"
      t.integer :amount , null: false
      t.decimal :price , null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
      
    end
  end
end
