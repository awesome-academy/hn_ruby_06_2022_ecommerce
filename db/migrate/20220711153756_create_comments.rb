class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :rate
      t.references :user, null: true, foreign_key: true
      t.references :book, null: true, foreign_key: true

      t.timestamps
    end
  end
end
