class RenameSizeFkInOrder < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :sizes_id, :size_id
  end
end
