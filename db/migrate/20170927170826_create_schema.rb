class CreateSchema < ActiveRecord::Migration[5.1]
  def change
    create_table(:ingredients) do |t|
      t.column(:ingredient, :string)
    end
    create_table(:recipes) do |t|
      t.column(:recipe, :string)
      t.column(:rating, :int)
      t.column(:instructions, :string)
    end
    create_table(:tags) do |t|
      t.column(:ingredient, :string)
    end
    create_table(:ingredients_recipes_tags) do |t|
      t.column(:ingredients_id, :int)
      t.column(:recipes_id, :int)
      t.column(:tags_id, :int)
    end
  end
end
