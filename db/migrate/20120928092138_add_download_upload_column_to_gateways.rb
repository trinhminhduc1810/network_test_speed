class AddDownloadUploadColumnToGateways < ActiveRecord::Migration
  def change
    add_column :gateways, :upload, :float
    add_column :gateways, :download, :float
  end
end
