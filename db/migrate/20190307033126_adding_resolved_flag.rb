class AddingResolvedFlag < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :resolved, :boolean, deafault: false
  end
end
