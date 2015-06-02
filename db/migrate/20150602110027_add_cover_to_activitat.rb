class AddCoverToActivitat < ActiveRecord::Migration
  def self.up
    add_attachment :activitats, :cover
  end

  def self.down
    remove_attachment :activitats, :cover
  end
end
