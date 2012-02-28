class CreateInscriptions < ActiveRecord::Migration
  def change
    create_table :inscriptions do |t|
      t.references :lesson
      t.references :user
      t.datetime :date
      t.boolean :flag_paye

      t.timestamps
    end
    add_index :inscriptions, :lesson_id
    add_index :inscriptions, :user_id
  end
end
