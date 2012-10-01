class RemoveUploadDownloadColumn < ActiveRecord::Migration
  def up
    remove_column :gateways, :download
    remove_column :gateways, :upload
  end

  def down
  end
end
