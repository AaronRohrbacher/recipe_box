class FixBookColumn < ActiveRecord::Migration[5.1]
  def change
    drop_table(:books)
    create_table(:books) do |t|
      t.column(:ingredient_id, :int)
      t.column(:recipe_id, :int)
      t.column(:tag_id, :int)
    end
  end
end
