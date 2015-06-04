class AddSmallCoverToActivitat < ActiveRecord::Migration
  def self.up
    add_attachment :activitats, :small_cover
  end

  def self.down
    remove_attachment :activitats, :small_cover
  end
end
