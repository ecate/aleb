class CreateOrganisateurs < ActiveRecord::Migration
  def change
    create_table :organisateurs do |t|
      t.string :nom
      t.text :description
      t.string :avatar

      t.timestamps
    end
  end
end
