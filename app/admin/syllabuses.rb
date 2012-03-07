# -*- coding: utf-8 -*-
ActiveAdmin.register Syllabus do

  filter :name, :label => "Nom", :as => :string
  filter :organisateur
  filter :label
  filter :categorie
  filter :created_at, :label => "Date de création"

  scope :all
  scope :actifs, :default => true
  scope :expires


  index do
    column :organisateur, :sortable => :organisateur do |cours|
      span
      a link_to(image_tag(cours.organisateur.avatar.thumb.url), admin_organisateur_path(cours.organisateur)) unless cours.organisateur.nil?
      i cours.organisateur.name unless cours.organisateur.nil?
    end
    column "Logo", :sortable => false do |cours|
      image_tag(cours.logo.thumb.url) unless cours.logo.nil?
    end
    column "Titre", :sortable => :name do |cours|
      b link_to cours.name, admin_syllabus_path(cours) unless cours.name.nil?
    end
    column :duree, :sortable => :duree do |cours|
      humanize(cours.duree) unless cours.duree.nil?
    end

    column "Prix", :sortable => :prixbase do |cours|
      number_to_currency(cours.prixbase) unless cours.prixbase.nil?
    end
    column "Réduction", :sortable => :reduction do |cours|
      number_to_percentage(cours.reduction, :precision => 1) unless cours.reduction.nil?
    end
    column "Description", :sortable => false do |cours|
      truncate(cours.description, :length => 80) unless cours.description.nil?
    end

    column "Catégorie", :sortable => false do |cours|
      status_tag(cours.categorie.name, :ok) unless cours.label.nil?
    end

    column "Label", :sortable => false do |cours|
      image_tag(cours.label.avatar.thumb.url) unless cours.label.nil?

    end
    default_actions
  end

  before_create do |cours|


  end
  #form pour edit et new
  form do |f|

    f.inputs "||     PAGE EN CONSTRUCTION     || ||     PAGE EN CONSTRUCTION     || ||     PAGE EN CONSTRUCTION    ||" do
    end

      if !f.object.new_record?
        f.inputs "Logo en base" do
          image_tag(Syllabus.find(params[:id]).logo.thumb.url)
        end
      end
    f.inputs "Cours", :multipart => true do

      f.input :organisateur
      f.input :name
      f.input :description, :input_html => {:rows => 3}
      f.input :logo, :label => "logo : télécharger un fichier ..."
      f.input :remote_logo_url, :label => "Ou récuperer une image en ligne URL:"
      f.input :label
      f.input :categorie

      f.input :prixbase

      f.input :reduction
      f.input :flag_pas_date, :as => :radio, :label => "Dates définies"

    end

    if true
      f.inputs "Cours interne" do
        f.input :nb_min_apprenants, :label => "Nombre minimum d'apprenants"
        f.input :nb_max_apprenants, :label => "Nombre maximum d'apprenants"


        f.input :flag_lieu_defini, :label => "Lieu défini ?", :as => :radio, :value => false

        f.input :adresse_etablissement, :label => "Nom établissement"
        f.input :adresse_num_voie, :label => "Numéro et voie"
        f.input :adresse_complement, :label => "Complément d'adresse'"
        f.input :adresse_codepostal, :label => "Code Postal"
        f.input :adresse_ville, :label => "Ville"

      end
    else

      f.inputs "Cours externe" do
        f.input :lien
        f.input :contact_reservation
      end
    end

    #Affichage du logo en base si le cours existe deja
    if !f.object.new_record?


      f.inputs "Admin" do
        f.input :created_at, :as => :string, :input_html => {:disabled => true}
        f.input :updated_at, :as => :string, :input_html => {:disabled => true}
      end
    end
    f.buttons
  end


end
