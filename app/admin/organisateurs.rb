ActiveAdmin.register Organisateur do

 index :as => :grid, :columns => 4 do |organisateur|
    h2 organisateur.nom
    div do
      a :href => admin_organisateur_path(organisateur) do
        image_tag(organisateur.avatar.url)
      end
    end
    h6 truncate(organisateur.description, :length => 40)
 end

 filter :nom
 filter :created_at, :label => "cree le"


 show do |org|
       attributes_table do
         row :nom
         row :description
         row :avatar do
           image_tag(org.avatar.url)
         end
       end
     end


 #form pour edit et new
 form do |f|
   f.inputs "Organisateur", :multipart => true do
     f.input :nom
     f.input :description
     f.input :avatar, :label => "Avatar : telecharger un fichier ..."
     f.input :remote_avatar_url, :label => "Ou recuperer une image en ligne URL:"
   end

   #Affichage de l'avatar en base si organisateur existe deja
   if !f.object.new_record?
     f.inputs "Avatar en base" do
       image_tag(Organisateur.find(params[:id]).avatar.thumb.url)
     end
   end
   f.buttons
 end


end
