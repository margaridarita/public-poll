class AddColumnPrivateToPolls < ActiveRecord::Migration[7.0]
  def change
    add_column :polls, :private, :boolean, default: false
  end
end
