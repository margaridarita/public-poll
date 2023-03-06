class CreatePolls < ActiveRecord::Migration[7.0]
  def change
    create_table :polls do |t|
      t.string :question
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
