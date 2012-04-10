class AddFlagInterneToSyllabuses < ActiveRecord::Migration
  def change
    add_column :syllabuses, :flag_interne, :boolean

  end
end
