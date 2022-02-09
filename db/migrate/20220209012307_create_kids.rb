class CreateKids < ActiveRecord::Migration[6.1]
  def change
    create_table :kids do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.references :user, null: false, foreign_key: true
      t.references :dictionary, null: false, foreign_key: true
      t.string :ethnicity
      t.string :gender_identity
      t.string :sexual_orientation
      t.date :birthday

      t.timestamps
    end
  end
end
