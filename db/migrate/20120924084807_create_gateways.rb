class CreateGateways < ActiveRecord::Migration
  def change
    create_table :gateways do |t|
      t.string :name
      t.string :upload
      t.string :download

      t.timestamps
    end
  end
end
