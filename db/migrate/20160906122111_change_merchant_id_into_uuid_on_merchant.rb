class ChangeMerchantIdIntoUuidOnMerchant < ActiveRecord::Migration[5.0]
  def change
    change_column :merchants, :id, :string
  end
end
