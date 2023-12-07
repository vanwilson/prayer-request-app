class AddPrayForAndTypeAndUserIdToPrayers < ActiveRecord::Migration[7.0]
  def change
    add_column :prayers, :pray_for, :string
    add_column :prayers, :type, :string
    add_column :prayers, :user_id, :integer
  end
end
