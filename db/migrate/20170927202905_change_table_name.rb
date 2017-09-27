class ChangeTableName < ActiveRecord::Migration[5.1]
  def change
    drop_table(:ingredients_recipes_tags)
    create_table(:book) do |t|
      t.column(:ingredients_id, :int)
      t.column(:recipes_id, :int)
      t.column(:tags_id, :int)
    end
  end
end
