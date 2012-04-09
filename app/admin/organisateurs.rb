# -*- coding: utf-8 -*-
ActiveAdmin.register Organisateur do

 index :as => :grid, :columns => 4 do |organisateur|
    h2 link_to(organisateur.name,admin_organisateur_path(organisateur))
    div do
      a :href => admin_organisateur_path(organisateur) do
        image_tag(organisateur.avatar.url)
      end
      a link_to "voir les cours", cours_admin_organisateur_path(organisateur)
    end
    para truncate(organisateur.description, :length => 40)
 end

 filter :name, :label => "Organisateur"
 filter :created_at, :label => "créé le"


 show :title => :name do |org|

       attributes_table do
         row :name
         row :description
         row :avatar do
           image_tag(org.avatar.url)
         end
         row "Cours" do
          link_to "Voir les cours", cours_admin_organisateur_path(org)
           end
       end
     end


 #form pour edit et new
 form do |f|
   f.inputs "Organisateur", :multipart => true do
     f.input :name
     f.input :description,:input_html => {:rows => 3}
     f.input :avatar, :label => "Avatar : télécharger un fichier ..."
     f.input :remote_avatar_url, :label => "Ou récuperer une image en ligne URL:"
   end

   #Affichage de l'avatar en base si organisateur existe deja
   if !f.object.new_record?

     f.inputs "Avatar en base" do
       image_tag(Organisateur.find(params[:id]).avatar.thumb.url) unless Organisateur.find(params[:id]).avatar.class == NilClass
     end
   end
   f.buttons
 end

 member_action :cours  do
   @organisateur= Organisateur.find(params[:id])
   # dans /app/views/admin/organisateurs/cours.html.arb
   render
  end

end
