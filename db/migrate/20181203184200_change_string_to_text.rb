class ChangeStringToText < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :commentContent, :text
    change_column :histories, :body, :text
    change_column :workshops, :resume, :text
  end
end
