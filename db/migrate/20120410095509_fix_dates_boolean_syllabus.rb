class FixDatesBooleanSyllabus < ActiveRecord::Migration
  def change
      rename_column :syllabuses, :flag_pas_date, :flag_date
  end
end
