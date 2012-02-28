class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.references :syllabus
      t.date :date
      t.time :debut
      t.boolean :flag_recurrent
      t.timestamps
    end
    add_index :lessons, :syllabus_id
  end
end
