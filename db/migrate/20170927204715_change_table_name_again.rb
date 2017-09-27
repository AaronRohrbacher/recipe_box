class ChangeTableNameAgain < ActiveRecord::Migration[5.1]
  def change
    drop_table(:book)
    create_table(:books) do |t|
      t.column(:ingredients_id, :int)
      t.column(:recipes_id, :int)
      t.column(:tags_id, :int)
    end
  end
end
