class CreateWorkshopCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :workshop_categories do |t|
      t.references :category, foreign_key: true
      t.references :workshop, foreign_key: true

      t.timestamps
    end
  end
end
