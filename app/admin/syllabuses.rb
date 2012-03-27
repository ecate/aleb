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
  scope :orphelins


  index do
    column :organisateur, :sortable => :organisateur do |cours|
      span
      a link_to(image_tag(cours.organisateur.avatar.thumb.url), admin_organisateur_path(cours.organisateur)) unless cours.organisateur.class == NilClass
      i cours.organisateur.name unless cours.organisateur.class == NilClass
    end
    column "Logo", :sortable => false do |cours|
      image_tag(cours.logo.thumb.url) unless cours.logo.class == NilClass
    end
    column "Titre", :sortable => :name do |cours|
      b link_to cours.name, admin_syllabus_path(cours) unless cours.name.class == NilClass
    end
    column :duree, :sortable => :duree do |cours|
      humanize(cours.duree) unless cours.duree.class == NilClass
    end

    column "Prix", :sortable => :prixbase do |cours|
      number_to_currency(cours.prixbase) unless cours.prixbase.class == NilClass
    end
    column "Réduction", :sortable => :reduction do |cours|
      number_to_percentage(cours.reduction, :precision => 1) unless cours.reduction.class == NilClass
    end
    column "Description", :sortable => false do |cours|
      truncate(cours.description, :length => 80) unless cours.description.class == NilClass
    end

    column "Catégorie", :sortable => false do |cours|
      status_tag(cours.categorie.name, :ok) unless cours.categorie.class == NilClass
    end

    column "Label", :sortable => false do |cours|
      image_tag(cours.label.avatar.thumb.url) unless cours.label.class == NilClass

    end
    default_actions
  end

  before_create do |cours|


  end
  #form pour edit et new
  form do |f|

    if params[:id]
      @duree= "En base : "+ humanize(Syllabus.find(params[:id]).duree)
    else
      @duree=""
    end

    f.inputs "Logo" do

      unless f.object.new_record?
      if !Syllabus.find(params[:id]).logo.class == NilClass
        f.template.image_tag(Syllabus.find(params[:id]).logo.url)

      end
      end
        f.input :logo, :label => "logo : télécharger un fichier ..."
        f.input :remote_logo_url, :label => "Ou récuperer une image en ligne URL:"

      end



    f.inputs "Cours", :multipart => true do
      f.input :flag_actif, :id => "flag_actif", :as => :radio, :label => "Validité", :collection => [["Actif", true], ["Expiré", false]]
      f.input :organisateur
      f.input :name
      f.input :description
      f.input :label
      f.input :categorie
      f.input :duree, :as => :select, :hint => @duree, :collection => ["00:30", "01:00", "01:30", "02:00", "02:30", "03:00", "03:30", "04:00", "04:30"]
      f.input :prixbase

      f.input :reduction
      f.input :flag_pas_date, :as => :radio, :label => "Dates définies"

    end

    if true
      f.inputs "Cours interne", :id => "panel_interne" do
        f.input :nb_min_apprenants, :label => "Nombre minimum d'apprenants"
        f.input :nb_max_apprenants, :label => "Nombre maximum d'apprenants"


        f.input :flag_lieu_defini, :id=> "flag_lieu_defini", :label => "Lieu défini ?", :as => :radio, :value => false

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

  controller do
    def create
      @syllabus = Syllabus.new(params[:syllabus])

      @syllabus.duree= params[:syllabus][:duree].split(":").first.to_i.hours + params[:syllabus][:duree].split(":").second.to_i.minutes

      @syllabus.save
      redirect_to admin_syllabus_path(@syllabus)
    end

    def update
      def semicolonize(s)
        return "00:00" if s.class == NilClass
        h = s / 3600
        s -= h * 3600
        m = s / 60
        if m==0
          return h.to_s << "h"
        end
        [h, m].join(":")
      end

      @syllabus = Syllabus.new(params[:syllabus])
      #if params[:syllabus][:duree].empty?
      #  params[:syllabus][:duree]= semicolonize(Syllabus.find_by_id(params[:syllabus][:id]).duree.to_i)
      #else
      #  params[:syllabus][:duree]= params[:syllabus][:duree].split(":").first.to_i.hours + params[:syllabus][:duree].split(":").second.to_i.minutes
      #end

      @syllabus.update_attributes(params[:syllabus])
      redirect_to admin_syllabus_path(@syllabus)
    end
  end

     #  duree                 :integer(4)
     #  flag_actif            :boolean(1)
     #  flag_pas_date         :boolean(1)
     #  nb_min_apprenants     :integer(4)
     #  nb_max_apprenants     :integer(4)
     #  lien                  :string(255)
     #  contact_reservation   :string(255)
     #  adresse_etablissement :string(255)
     #  adresse_num_voie      :string(255)
     #  adresse_complement    :string(255)
     #  adresse_codepostal    :integer(4)
     #  adresse_ville         :string(255)
     #  flag_lieu_defini      :boolean(1)


end


