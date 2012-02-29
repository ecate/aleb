# == Schema Information
#
# Table name: syllabuses
#
#  id                    :integer(4)      not null, primary key
#  titre                 :string(255)
#  description           :text
#  logo                  :string(255)
#  categorie_id          :integer(4)
#  prixbase              :float
#  reduction             :float
#  duree                 :time
#  flag_actif            :boolean(1)
#  flag_pas_date         :boolean(1)
#  flag_interne          :boolean(1)
#  nb_min_apprenants     :integer(4)
#  nb_max_apprenants     :integer(4)
#  lien                  :string(255)
#  contact_reservation   :string(255)
#  adresse_etablissement :string(255)
#  adresse_num_voie      :string(255)
#  adresse_complement    :string(255)
#  adresse_codepostal    :integer(4)
#  flag_lieu_defini      :boolean(1)
#  created_at            :datetime        not null
#  updated_at            :datetime        not null
#

class Syllabus < ActiveRecord::Base
  belongs_to :organisateur
  has_many :lessons
  has_one :categorie
  has_one :labels
  mount_uploader :logo, ImageUploader


end
