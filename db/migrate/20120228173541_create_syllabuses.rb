class CreateSyllabuses < ActiveRecord::Migration
  def change
    create_table :syllabuses do |t|
      t.string :name
      t.text :description
      t.string :avatar
      t.references :organisateur
      t.references :label
      t.references :categorie
      t.float :prixbase
      t.float :reduction
      t.integer :duree
      t.boolean :flag_actif, :default => false
      t.boolean :flag_date, :default => false
      t.boolean :flag_interne, :default => false
      t.boolean :flag_lieu_defini, :default => false
      t.integer :nb_min_apprenants
      t.integer :nb_max_apprenants
      t.string :lien
      t.string :contact_reservation
      t.string :adresse_etablissement
      t.string :adresse_num_voie
      t.string :adresse_complement
      t.integer :adresse_codepostal
      t.string :adresse_ville

      t.timestamps
    end
    add_index :syllabuses, :categorie_id
  end
end
