class AddNotedAtToAnnotation < ActiveRecord::Migration[5.2]
  def change
    add_column :annotations, :noted_at, :datetime
  end
end
