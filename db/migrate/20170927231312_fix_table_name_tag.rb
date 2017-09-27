class FixTableNameTag < ActiveRecord::Migration[5.1]
  def change
    drop_table(:tags)
    create_table(:tags) do |t|
      t.column(:tag, :string)
    end
  end
end
