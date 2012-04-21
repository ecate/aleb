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
    column "Interne", :sortable => :flag_interne do |cours|
      if !cours.flag_interne.class == NilClass
        if cours.flag_interne
          para "Interne"
        else
          para "Externe"
        end
      else
        i "non défini"
      end
    end
    column "avatar", :sortable => false do |cours|
      image_tag(cours.avatar.thumb.url) unless cours.avatar.class == NilClass
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


    f.inputs "avatar" do
      if !f.object.new_record?
      f.inputs "En base" do
        image_tag(Syllabus.find(params[:id]).avatar.url) unless Syllabus.find(params[:id]).avatar.class == NilClass
      end
      end
      f.input :avatar, :label => "avatar : télécharger un fichier ..."
      f.input :remote_avatar_url, :label => "Ou récuperer une image en ligne URL:"
    end



    f.inputs "Cours" do
      f.input :flag_actif, :id => "flag_actif", :as => :radio, :label => "Validité", :collection => [["Actif", true], ["Expiré", false]]
      f.input :organisateur
      f.input :flag_interne, :label => "Cours interne ?", :as => :radio
      f.input :name
      f.input :description
      f.input :label
      f.input :categorie
      f.input :duree, :as => :select, :hint => @duree, :collection => ["00:30", "01:00", "01:30", "02:00", "02:30", "03:00", "03:30", "04:00", "04:30"]
      f.input :prixbase
      f.input :reduction
      f.input :flag_date, :as => :radio, :label => "Dates plannifiées ?"

    end


      f.inputs "Cours interne", :id => "panel_interne" do
        f.input :nb_min_apprenants, :label => "Nombre minimum d'apprenants"
        f.input :nb_max_apprenants, :label => "Nombre maximum d'apprenants"


        f.input :flag_lieu_defini, :id => "flag_lieu_defini", :label => "Lieu défini ?", :as => :radio, :value => false

        f.input :adresse_etablissement, :label => "Nom établissement"
        f.input :adresse_num_voie, :label => "Numéro et voie"
        f.input :adresse_complement, :label => "Complément d'adresse'"
        f.input :adresse_codepostal, :label => "Code Postal"
        f.input :adresse_ville, :label => "Ville"

      end


      f.inputs "Cours externe", :id => "panel_externe" do
        f.input :lien
        f.input :contact_reservation
      end
    f.inputs "Lessons plannifiées", :id => "panel_dates" do
      f.has_many :lessons do |lesson|
       lesson.input :horaire
      end


    end

    #Affichage du avatar en base si le cours existe deja
    if !f.object.new_record?


      f.inputs "Admin" do
        f.input :created_at, :as => :string, :input_html => {:disabled => true}
        f.input :updated_at, :as => :string, :input_html => {:disabled => true}
      end
    end
    f.buttons
  end

  show do |cours|
    attributes_table do
      row :name
      row :image do
        image_tag(cours.avatar.url)
      end
      row :description
      row :organisateur do |cours|
        link_to cours.organisateur.name, admin_organisateur_path(cours.organisateur)
      end
      row :label do |cours|
        image_tag(cours.label.avatar.thumb.url) unless cours.label.class == NilClass
      end
      row :categorie do |cours|
        status_tag(cours.categorie.name, :ok)
      end
      row :prix do |cours|
        number_to_currency(cours.prixbase)
      end
      row :reduction do |cours|
        number_to_percentage(cours.reduction, :precision => 1)
      end
      row :duree do |cours|
        humanize(cours.duree) unless cours.duree.class == NilClass
      end
      row :cours_interne_externe do |cours|
       if !(cours.flag_interne.class == NilClass)
         if cours.flag_interne
            para "Interne"
         else
            para "Externe"
         end
       else
         i "non défini"
       end
      end
      row :en_cours do |cours|
        if cours.flag_actif
          para "Cours actif"
        else
          para "Cours expiré"
        end
      end
      row :lessons_plannifiees do |cours|
        if !(cours.flag_date.class == NilClass)
          if cours.flag_date
            cours.lessons.each do |l|
              para l.horaire
            end
          end
        else
          para "Pas de dates"
        end
      end

      row :lieu_defini do |cours|
        if !(cours.flag_lieu_defini.class == NilClass)
                 if cours.flag_lieu_defini
                    para "Oui"
                 else
                    para "Non"
                 end
               else
                 i "non défini"
               end
      end
      row :nb_min_apprenants
      row :nb_max_apprenants
      row :lien
      row :contact_reservation
      row :adresse_etablissement
      row :adresse_num_voie
      row :adresse_complement
      row :adresse_codepostal
      row :adresse_ville

    end
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

      @syllabus = Syllabus.find(params[:id])
      if params[:syllabus][:duree].empty?
        params[:syllabus][:duree]= @syllabus.duree
      else
        params[:syllabus][:duree]= params[:syllabus][:duree].split(":").first.to_i.hours + params[:syllabus][:duree].split(":").second.to_i.minutes
      end

      @syllabus.update_attributes(params[:syllabus])
      redirect_to admin_syllabus_path(@syllabus)
    end
  end

     #  duree                 :integer(4)
     #  flag_actif            :boolean(1)
     #  flag_date         :boolean(1)
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


