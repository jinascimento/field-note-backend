class CreateAnnotations < ActiveRecord::Migration[5.2]
  def change
    create_table :annotations do |t|
      t.text :description
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
