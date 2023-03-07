class RemoveCategoryFromPolls < ActiveRecord::Migration[7.0]
  def change
    remove_column :polls, :category, :string
  end
end
