class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.date :birthday
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
