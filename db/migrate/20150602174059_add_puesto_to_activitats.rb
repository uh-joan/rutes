class AddPuestoToActivitats < ActiveRecord::Migration
  def change
    add_column :activitats, :puesto, :string
  end
end
