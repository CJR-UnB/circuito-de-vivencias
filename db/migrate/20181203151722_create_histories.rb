class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.string :time
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end