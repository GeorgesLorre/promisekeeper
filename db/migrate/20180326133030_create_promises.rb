class CreatePromises < ActiveRecord::Migration[5.1]
  def change
    create_table :promises do |t|
      t.string :title
      t.text :description
      t.string :condition
      t.string :status
      t.date :deadline
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
