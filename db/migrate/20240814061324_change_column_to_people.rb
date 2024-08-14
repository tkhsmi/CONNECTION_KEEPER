class ChangeColumnToPeople < ActiveRecord::Migration[7.1]
  def change
    change_column_null :people, :furigana, false
  end
end
