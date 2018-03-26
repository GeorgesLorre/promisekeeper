class CreateWitnesses < ActiveRecord::Migration[5.1]
  def change
    create_table :witnesses do |t|
      t.boolean :mark_done
      t.string :account_status
      t.references :user, foreign_key: true
      t.references :promise, foreign_key: true

      t.timestamps
    end
  end
end
