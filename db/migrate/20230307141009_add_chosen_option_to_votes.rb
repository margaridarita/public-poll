class AddChosenOptionToVotes < ActiveRecord::Migration[7.0]
  def change
    add_column :votes, :chosen_option, :string
  end
end
