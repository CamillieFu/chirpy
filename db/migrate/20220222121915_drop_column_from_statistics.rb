class DropColumnFromStatistics < ActiveRecord::Migration[6.1]
  def change
    remove_column :statistics, :total_tweets
    remove_column :statistics, :angry_tweets
    remove_column :statistics, :sad_tweets
    remove_column :statistics, :fearful_tweets
    remove_column :statistics, :joyful_tweets
    remove_column :statistics, :analytical_tweets
    remove_column :statistics, :confident_tweets
    remove_column :statistics, :tentative_tweets
    add_column :statistics, :tone, :integer
  end
end
