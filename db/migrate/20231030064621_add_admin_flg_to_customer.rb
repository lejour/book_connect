class AddAdminFlgToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :admin_flg, :boolean
  end
end
