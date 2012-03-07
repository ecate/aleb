class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :name
      t.string :avatar
      t.boolean :flag_interne

      t.timestamps
    end
  end
end
