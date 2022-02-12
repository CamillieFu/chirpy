class CreateStatistics < ActiveRecord::Migration[6.1]
  def change
    create_table :statistics do |t|
      t.integer :total_tweets
      t.integer :angry_tweets
      t.integer :sad_tweets
      t.integer :fearful_tweets
      t.integer :joyful_tweets
      t.integer :analytical_tweets
      t.integer :confident_tweets
      t.integer :tentative_tweets

      t.timestamps
    end
  end
end
