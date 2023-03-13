class AddVotesCountToPolls < ActiveRecord::Migration[7.0]
  def change
    add_column :polls, :votes_count, :integer, default: 0
  end
end
