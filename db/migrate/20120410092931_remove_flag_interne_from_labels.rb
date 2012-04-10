class RemoveFlagInterneFromLabels < ActiveRecord::Migration
  def up
    remove_column :labels, :flag_interne
      end

  def down
    add_column :labels, :flag_interne, :boolean
  end
end
