class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :email
      t.string :mobile
      t.string :name
      t.string :problem
      t.boolean :is_active
      t.timestamps null: false
    end
  end
end
