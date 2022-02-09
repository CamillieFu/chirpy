class ChangeWordsToBeArrayInDictionaries < ActiveRecord::Migration[6.1]
  def change
    change_column :dictionaries, :words, :string, array: true, default: [], using: "(string_to_array(words, ','))"
  end
end
