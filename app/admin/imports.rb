# -*- coding: utf-8 -*-
ActiveAdmin.register Import do
  config.clear_sidebar_sections!


  form do |f|

    f.inputs "Importer des cours en masse", :multipart => true do
      f.input :spread, :label => "Télécharger un fichier "
      f.input :remote_spread_url, :label => "Ou récupérer un fichier en ligne URL:"
    end
    f.buttons
  end


  index do

    if !(session[:cours_created].class == NilClass)
      h2 "Liste des cours du dernier fichier d'import"
      for id in session[:cours_created]
        cours=Syllabus.find_by_id(id)
        if !cours.nil?
          div
          h4 link_to cours.name, admin_syllabus_path(cours) unless cours.name.class == NilClass
          a image_tag(cours.avatar.thumb.url) unless cours.avatar.class == NilClass
          i cours.organisateur.class == NilClass ? "! Organisateur manquant !" : "Organisateur: "+ Organisateur.find_by_id(cours.organisateur_id).name
          div
          span truncate(cours.description, :length => 80)
          div
          span b cours.label.class == NilClass ? "- " : Label.find_by_id(cours.label_id).name + " - "
          span cours.categorie.class == NilClass ? "! Categorie Manquante ! - " : Categorie.find_by_id(cours.categorie.id).name + " - "
          span cours.prixbase.class == NilClass ? "PRIX manquant! - " : number_to_currency(cours.prixbase, :locale => :fr) + " - "
          span cours.reduction.to_s + "% - " unless cours.reduction.class == NilClass
          span humanize(cours.duree.to_i) unless cours.duree.class == NilClass

          Lesson.find_all_by_syllabus_id(cours.id).each do |lesson|
            li I18n.localize(lesson.horaire, :format => :long, :locale => :fr)
          end
          hr
          br
        end
      end

    end
  end


  after_create do |import|

    # les fonctions d'aide
    def r_categorie cell
      if cell.empty?
        return nil
      end
      categorie= Categorie.find_by_name(cell)
      return categorie.id unless categorie.nil?
      nil
    end

    def r_organisateur cell
      if cell.empty?
        return nil
      end
      organisateur= Organisateur.find_by_name(cell)
      return organisateur.id unless organisateur.nil?
      nil
    end

    def r_label cell
      if cell.empty?
        return nil
      end
      label= Label.find_by_name(cell)
      return label.id unless label.nil?
      nil
    end

    # retourne duree en secondes
    def r_duree cell

      if cell.empty?
        return nil
      end
      cell.split(":").first.to_i.hours + cell.split(":").second.to_i.minutes
    end

    #retourne une date
    def r_date cell
      if cell.empty?
        return nil
      end
      Date.new(cell.split("/").third.to_i, cell.split("/").second.to_i, cell.split("/").first.to_i)
    end

    # retourne duree en secondes
    def r_time cell, horaire
      if cell.empty?
        return nil
      end
      DateTime.new(cell.split("/").third.to_i, cell.split("/").second.to_i, cell.split("/").first.to_i, horaire.split(":").first.to_i, horaire.split(":").second.to_i)
    end

    def r_time_formate cell, horaire
      if cell.nil? || horaire.empty?
        return nil
      end
      DateTime.new(cell.year, cell.month, cell.day, horaire.to_s.split(":").first.to_i, horaire.to_s.split(":").second.to_i)
    end

    # TODO a mettre à jour avec la liste des labels


    def r_pas_date cell
      if cell.empty?
        return nil
      end
      case cell.downcase
        when "oui" then
          false
        when "non" then
          true
      end
    end

    def r_interne cell
      if !(cell.empty?)
        case cell.capitalize
          when "Interne" then return true
          when "Externe" then return false
        end
      end
      return false
    end

    def r_lieu cell
      if cell.empty?
        return nil
      end
      case cell.downcase
        when "oui" then
          true
        when "non" then
          false
      end
    end

    def r_recurrent cell
      if cell.empty?
        return nil
      end
      cell= cell.downcase
      case cell
        when "oui" then
          true
        when "non" then
          false
      end
    end

    def r_dayn cell
      if cell.empty?
        return nil
      end
      case cell.downcase
        when "lundi" then
          0
        when "mardi" then
          1
        when "mercredi" then
          2
        when "jeudi" then
          3
        when "vendredi" then
          4
        when "samedi" then
          5
        when "dimanche" then
          6
      end
    end

    # param de session contient la liste des cours crees pour affichage de controle
    session[:cours_created]=""

    f = Excel.new("#{Rails.root}/public"+"#{import.spread}")
    f.default_sheet = f.sheets.first
    newcours = Array.new

    4.upto(f.last_row) do |line|

      #MAPPING avec template excel
      _name= f.cell(line, 'B').to_s
      _categorie= f.cell(line, 'D').to_s
      _organisateur= f.cell(line, 'A').to_s
      _label= f.cell(line, 'E').to_s
      _interne= f.cell(line, 'F').to_s
      _description= f.cell(line, 'G').to_s
      _prixbase= f.cell(line, 'H').to_s.to_f
      _duree= f.cell(line, 'J').to_s
      _avatarurl= f.cell(line, 'C').to_s
      _reduc= f.cell(line, 'I').to_s.to_f
      _minappr= f.cell(line, 'K').to_s.to_i
      _maxappr= f.cell(line, 'L').to_s.to_i
      _lien= f.cell(line, 'M').to_s
      _contact= f.cell(line, 'N').to_s
      _lieu= f.cell(line, 'O').to_s
      _etab= f.cell(line, 'P').to_s
      _voie= f.cell(line, 'Q').to_s
      _comp= f.cell(line, 'R').to_s
      _cp= f.cell(line, 'S').to_s.to_i
      _ville= f.cell(line, 'T').to_s
      _date= f.cell(line, 'U').to_s
      _jd1= f.cell(line, 'V').to_s
      _hd1= f.cell(line, 'W').to_s
      _jd2= f.cell(line, 'X').to_s
      _hd2= f.cell(line, 'Y').to_s
      _jd3= f.cell(line, 'Z').to_s
      _hd3= f.cell(line, 'AA').to_s
      _jd4= f.cell(line, 'AB').to_s
      _hd4= f.cell(line, 'AC').to_s
      _jd5= f.cell(line, 'AD').to_s
      _hd5= f.cell(line, 'AE').to_s
      _rec= f.cell(line, 'AF').to_s
      _sem= f.cell(line, 'AG').to_s.to_i
      _jr1= f.cell(line, 'AH').to_s
      _hr1= f.cell(line, 'AI').to_s
      _jr2= f.cell(line, 'AJ').to_s
      _hr2= f.cell(line, 'AK').to_s


      #on va crée le cours et les lessons de manière incrémentale selon les infos présentes dans le fichier excel
      cours= Syllabus.create!(:name => _name,
                              :categorie_id => r_categorie(_categorie),
                              :organisateur_id => r_organisateur(_organisateur),
                              :label_id => r_label(_label),
                              :description => _description,
                              :prixbase => _prixbase,
                              :duree => r_duree(_duree),
                              :flag_actif => false)

      cours.remote_avatar_url= _avatarurl unless _avatarurl.empty?
      cours.save!

      #remplissage et sauvegarde de l'object au fur et à mesure

      if !cours.nil?

        #reduction existante
        cours.reduction= _reduc unless _reduc == 0 || _reduc==""
        cours.save!

        cours.flag_interne= r_interne(_interne)

        #cours interne ou externe
          if cours.flag_interne
            cours.nb_min_apprenants= _minappr
            cours.nb_max_apprenants= _maxappr
            #on s'occupe du lieu s'il s'agit d'un cours interne
            if r_lieu(_lieu)
              cours.flag_lieu_defini= true
              cours.adresse_etablissement= _etab
              cours.adresse_num_voie= _voie
              cours.adresse_complement= _comp
              cours.adresse_codepostal= _cp
              cours.adresse_ville= _ville
            else
              cours.flag_lieu_defini= false
            end
          else
            cours.lien= _lien
            cours.contact_reservation= _contact
          end
          cours.save!

        if !r_pas_date(_date).nil?
          #dates définies
          if r_pas_date(_date)
            cours.flag_date= false
          else
            cours.flag_date= true
            #dates récurrentes
            if r_recurrent(_rec)

              #par defaut, recurrence sur 4 semaines
              (_sem != 0) ? n=_sem : n= 4

              cdate= Date.today

              n.times do

                Lesson.create!(:syllabus_id => cours.id, :horaire => r_time_formate(cdate.next_week.next_day(r_dayn(_jr1)), _hr1), :flag_recurrent => true) unless (_jr1.empty? || _hr1.empty?)
                Lesson.create!(:syllabus_id => cours.id, :horaire => r_time_formate(cdate.next_week.next_day(r_dayn(_jr2)), _hr2), :flag_recurrent => true) unless (_jr2.empty? || _hr2.empty?)
                cdate= cdate + 1.week
              end
            else

              #dates fixes
              Lesson.create!(:syllabus_id => cours.id, :horaire => r_time(_jd1, _hd1), :flag_recurrent => false) unless (_jd1.empty? || _hd1.empty?)
              Lesson.create!(:syllabus_id => cours.id, :horaire => r_time(_jd2, _hd2), :flag_recurrent => false) unless (_jd2.empty? || _hd2.empty?)
              Lesson.create!(:syllabus_id => cours.id, :horaire => r_time(_jd3, _hd3), :flag_recurrent => false) unless (_jd3.empty? || _hd3.empty?)
              Lesson.create!(:syllabus_id => cours.id, :horaire => r_time(_jd4, _hd4), :flag_recurrent => false) unless (_jd4.empty? || _hd4.empty?)
              Lesson.create!(:syllabus_id => cours.id, :horaire => r_time(_jd5, _hd5), :flag_recurrent => false) unless (_jd5.empty? || _hd5.empty?)
            end

          end

          cours.save!
        end
        newcours << cours.id
      end
    end


    #affichage
    session[:cours_created]=newcours
    import.destroy

  end


end
