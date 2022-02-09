class CreateDictionaries < ActiveRecord::Migration[6.1]
  def change
    create_table :dictionaries do |t|
      t.string :words

      t.timestamps
    end
  end
end
