class AddQrCodeToPoll < ActiveRecord::Migration[7.0]
  def change
    add_column :polls, :qr_code, :string
  end
end
