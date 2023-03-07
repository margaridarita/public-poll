class AddFirstOptionToPoll < ActiveRecord::Migration[7.0]
  def change
    add_column :polls, :first_option, :string
  end
end
