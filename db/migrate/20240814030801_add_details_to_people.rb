class AddDetailsToPeople < ActiveRecord::Migration[7.1]
  def change
    add_column :people, :furigana, :string
    add_column :people, :mail, :string
    add_column :people, :address, :string
    add_column :people, :phone_number, :string
  end
end
