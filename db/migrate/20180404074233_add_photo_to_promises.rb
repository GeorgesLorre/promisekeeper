class AddPhotoToPromises < ActiveRecord::Migration[5.1]
  def change
    add_column :promises, :photo, :string
  end
end
