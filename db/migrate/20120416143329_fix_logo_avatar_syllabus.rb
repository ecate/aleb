class FixLogoAvatarSyllabus < ActiveRecord::Migration
  def change
      rename_column :syllabuses, :logo, :avatar
  end
end
