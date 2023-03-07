class AddSecondOptionToPoll < ActiveRecord::Migration[7.0]
  def change
    add_column :polls, :second_option, :string
  end
end
