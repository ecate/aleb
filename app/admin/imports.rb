ActiveAdmin.register Import do
  form do |f|

    f.inputs "Importer des cours en masse", :multipart => true do
       f.input :spread, :label => "Telecharger un fichier ..."
       f.input :remote_spread_url, :label => "Ou recuperer un fichier en ligne URL:"
    end
    f.buttons
  end



  after_create do |import|
    f = Excel.new("#{import.spread.url}")
    f.default_sheet = f.sheets.first

    2.upto(f.last_row) do |line|
      fun_attitude= case f.cell(line, 'D')
                      when "cool" then 1
                      when "pragmatique" then 2
                      when "rigolo" then 3
                      when "joeur" then 4
                    end
      Syllabus.create!(
            :flag_active => true,
            :titre => f.cell(line,'A'),
            :remote_logo_url => f.cell(line,'B'),
            :categorie_id => Categorie.find_by_nom(f.cell(line,'C')).id,
            :label_id => Label.find_by_nom(f.cell(line,'D')).id,
            :description => f.cell(line,'E'),
            :prixbase => f.cell(line,'E'),
           :reduction =>
               :duree =>
          :flag_actif =>
       :flag_pas_date =>
        :flag_interne =>
   :nb_min_apprenants =>
   :nb_max_apprenants =>
                :lien =>
 :contact_reservation =>
 :adresse_etablissement =>
    :adresse_num_voie =>
  :adresse_complement =>
  :adresse_codepostal =>
    :flag_lieu_defini =>
      )

    end

    import.destroy

  end

end
