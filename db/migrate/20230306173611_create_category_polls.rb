class CreateCategoryPolls < ActiveRecord::Migration[7.0]
  def change
    create_table :category_polls do |t|
      t.references :category, null: false, foreign_key: true
      t.references :poll, null: false, foreign_key: true

      t.timestamps
    end
  end
end
