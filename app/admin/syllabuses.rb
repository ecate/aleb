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

end
