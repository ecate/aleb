class CreateLabelSyllabuses < ActiveRecord::Migration
  def change
    create_table :label_syllabuses do |t|
      t.references :syllabus
      t.references :label

      t.timestamps
    end
    add_index :label_syllabuses, :syllabus_id
    add_index :label_syllabuses, :label_id
  end
end
