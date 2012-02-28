class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :nom
      t.string :avatar

      t.timestamps
    end
  end
end
