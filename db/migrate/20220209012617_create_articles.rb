class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.date :date
      t.string :author
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
