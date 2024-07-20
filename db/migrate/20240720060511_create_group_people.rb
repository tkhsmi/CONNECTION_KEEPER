class CreateGroupPeople < ActiveRecord::Migration[7.1]
  def change
    create_table :group_people do |t|
      t.references :group, null: false, foreign_key: true
      t.references :people, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
