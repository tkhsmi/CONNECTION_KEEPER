class RenamePeopleIdColumnToGroupPerson < ActiveRecord::Migration[7.1]
  def change
    rename_column :group_people, :people_id, :person_id
  end
end
