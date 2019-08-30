class AddTimestampsToAuthor < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :created_at, :datetime
    add_column :authors, :updated_at, :datetime
  end
end
