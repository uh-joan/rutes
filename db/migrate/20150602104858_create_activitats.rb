class CreateActivitats < ActiveRecord::Migration
  def change
    create_table :activitats do |t|
      t.string :titol
      t.string :subtitol
      t.text :descripcio
      t.float :lat
      t.float :long
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
