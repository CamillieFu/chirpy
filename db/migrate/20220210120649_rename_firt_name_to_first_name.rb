class RenameFirtNameToFirstName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :firt_name, :first_name
  end
end
