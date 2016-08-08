class CreateMerchants < ActiveRecord::Migration[5.0]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :website
      t.string :industry
      t.boolean :active
      t.string :bank_mid
      t.string :notification_url
      t.string :notification_email

      t.timestamps
    end
  end
end
