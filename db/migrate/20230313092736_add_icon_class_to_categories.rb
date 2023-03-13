class AddIconClassToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :icon_class, :string
  end
end
