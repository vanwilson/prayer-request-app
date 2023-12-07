class ChangeColumnTypeToCategory < ActiveRecord::Migration[7.0]
  def change
    rename_column :prayers, :type, :prayer_type
  end
end
