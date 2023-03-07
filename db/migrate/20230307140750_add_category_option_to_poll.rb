class AddCategoryOptionToPoll < ActiveRecord::Migration[7.0]
  def change
    add_column :polls, :category, :string
  end
end
