class CreateSyllabuses < ActiveRecord::Migration
  def change
    create_table :syllabuses do |t|
      t.string :name
      t.text :description
      t.string :logo
      t.references :organisateur
      t.references :label
      t.references :categorie
      t.float :prixbase
      t.float :reduction
      t.integer :duree
      t.boolean :flag_actif
      t.boolean :flag_pas_date
      t.boolean :flag_interne
      t.integer :nb_min_apprenants
      t.integer :nb_max_apprenants
      t.string :lien
      t.string :contact_reservation
      t.string :adresse_etablissement
      t.string :adresse_num_voie
      t.string :adresse_complement
      t.integer :adresse_codepostal
      t.string :adresse_ville
      t.boolean :flag_lieu_defini
      t.timestamps
    end
    add_index :syllabuses, :categorie_id
  end
end
