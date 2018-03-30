class CreateTempWitnesses < ActiveRecord::Migration[5.1]
  def change
    create_table :temp_witnesses do |t|
      t.string :fullname
      t.string :encoded_fb_id
      t.string :pic_url
      t.references :promise, foreign_key: true

      t.timestamps
    end
  end
end
