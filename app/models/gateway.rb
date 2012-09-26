class Gateway < ActiveRecord::Base
  attr_accessible :download, :name, :upload
end
