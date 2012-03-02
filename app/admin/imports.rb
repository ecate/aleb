ActiveAdmin.register Import do


  form do |f|

    f.inputs "Importer des cours en masse", :multipart => true do
      f.input :spread, :label => "Telecharger un fichier ..."
      f.input :remote_spread_url, :label => "Ou recuperer un fichier en ligne URL:"
    end
    f.buttons
  end


  after_create do |import|
    def return_categorie cell
      cell= cell.capitalize
      Categorie.find_by_nom(cell).id
    end

    def return_integer i
      i.to_i

    end

    def return_float f
      f.to_f
    end


    def return_label cell
      cell= cell.capitalize
      Label.find_by_nom(cell).id
    end

    # retourne duree en secondes
    def return_duree cell
      cell= cell.to_s
      cell.split(":").first.to_i.hours + cell.split(":").second.to_i.minutes
    end

    #retourne une date
    def return_date cell
      cell= cell.to_s
      Date.new(cell.split("/").third.to_i, cell.split("/").second.to_i, cell.split("/").first.to_i)
    end

    # retourne duree en secondes
    def return_time cell, horaire
      cell= cell.to_s
      horaire= horaire.to_s

      DateTime.new(cell.split("/").third.to_i, cell.split("/").second.to_i, cell.split("/").first.to_i, horaire.split(":").first.to_i, horaire.split(":").second.to_i)
    end

    def return_time_formate cell ,horaire
      DateTime.new(cell.year, cell.month, cell.day, horaire.to_s.split(":").first.to_i, horaire.to_s.split(":").second.to_i)
    end

    # TODO a mettre à jour avec la liste des labels
    def return_flag_interne cell
      cell= cell.downcase
      case cell
        when "coup de coeur" then
          false
        when "cours maison" then
          true
        when "deal" then
          false
      end
    end

    def return_flag_pas_date cell
      cell= cell.downcase
      case cell
        when "oui" then
          false
        when "non" then
          true
      end
    end

    def return_flag_lieu_defini cell
      cell= cell.downcase
      case cell
        when "oui" then
          true
        when "non" then
          false
      end
    end

    def return_flag_recurrent cell
      cell= cell.to_s.downcase
      case cell
        when "oui" then
          true
        when "non" then
          false
      end
    end

    def return_day cell
      cell= cell.downcase
      case cell
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

    f = Excel.new("#{Rails.root}/public"+"#{import.spread.url}")
    f.default_sheet = f.sheets.first
    newcours = Array.new

    3.upto(f.last_row) do |line|


      cours= Syllabus.create!(:titre => f.cell(line, 'A'), :remote_logo_url => f.cell(line, 'B'),
                              :categorie_id => return_categorie(f.cell(line, 'C')),
                              :label_id => return_label(f.cell(line, 'D')),
                              :description => f.cell(line, 'E'),
                              :prixbase => return_float(f.cell(line, 'F')),
                              :duree => return_duree(f.cell(line, 'H')),
                              :flag_actif => true)

      #remplissage difference selon criteres


        if !cours.nil?

          #reduction existante
          reduc= return_float(f.cell(line, 'G'))
          cours.reduction= reduc unless reduc == 0
          cours.save!
          #selon le label, il s'agit d'un cours interne ou externe
          if return_flag_interne(f.cell(line, 'D'))
            cours.flag_interne= true
            cours.nb_min_apprenants= return_integer(f.cell(line, 'I'))
            cours.nb_max_apprenants= return_integer(f.cell(line, 'J'))
          else
            cours.flag_interne= false
            cours.lien= f.cell(line, 'K')
            cours.contact_reservation= f.cell(line, 'L')
          end
          cours.save!

          # lieu defini
          if return_flag_lieu_defini(f.cell(line, 'M'))
            cours.flag_lieu_defini= true
            cours.adresse_etablissement= f.cell(line, 'N')
            cours.adresse_num_voie= f.cell(line, 'O')
            cours.adresse_complement= f.cell(line, 'P')
            cours.adresse_codepostal= f.cell(line, 'Q').to_i
            cours.adresse_ville= f.cell(line, 'R')
          else
            cours.flag_lieu_defini= false
          end
          cours.save!

         #TODO remove la condition : on laisse les dates pour afficher les cours crées
          if 1 > 10
          #dates définies
          if return_flag_pas_date(f.cell(line, 'S'))
            cours.flag_pas_date= true
          else
            cours.flag_pas_date= false
            #dates récurrentes
            if return_flag_recurrent(f.cell(line, 'AD'))
              #par defaut, recurrence sur 4 semaines
              n= f.cell(line, 'AD').to_i
              (n != 0) ? n : n= 4

              cdate= Date.today
              #TODO remove n=1
              n=1
              n.times do

                #Lesson.create!(:syllabus_id => cours.id, :horaire => return_time_formate(cdate.next_week.next_day(return_day(f.cell(line, 'AF'))), f.cell(line, 'AG')), :flag_recurrent => true) unless (f.cell(line, 'AF').to_s.empty? || f.cell(line, 'AG').to_s.empty?)
                Lesson.create!(:syllabus_id => cours.id, :horaire => return_time("22/06/2012", "14:38"), :flag_recurrent => true) unless (f.cell(line, 'AF').to_s.empty? || f.cell(line, 'AG').to_s.empty?)
                #Lesson.create!(:syllabus_id => cours.id, :horaire => return_time_formate(cdate.next_week.next_day(return_day(f.cell(line, 'AH'))), f.cell(line, 'AI')), :flag_recurrent => true) unless (f.cell(line, 'AH').to_s.empty? || f.cell(line, 'AI').to_s.empty?)
                cdate= cdate + 1.week
              end
            else

              #dates fixes
              Lesson.create!(:syllabus_id => cours.id, :horaire => return_time(f.cell(line, 'T'), f.cell(line, 'U')), :flag_recurrent => true) unless (f.cell(line, 'T').to_s.empty? || f.cell(line, 'U').to_s.empty?)
              Lesson.create!(:syllabus_id => cours.id, :horaire => return_time(f.cell(line, 'V'), f.cell(line, 'W')), :flag_recurrent => true) unless (f.cell(line, 'V').to_s.empty? || f.cell(line, 'W').to_s.empty?)
              Lesson.create!(:syllabus_id => cours.id, :horaire => return_time(f.cell(line, 'X'), f.cell(line, 'X')), :flag_recurrent => true) unless (f.cell(line, 'X').to_s.empty? || f.cell(line, 'X').to_s.empty?)
              Lesson.create!(:syllabus_id => cours.id, :horaire => return_time(f.cell(line, 'Z'), f.cell(line, 'AA')), :flag_recurrent => true) unless (f.cell(line, 'Z').to_s.empty? || f.cell(line, 'AA').to_s.empty?)
              Lesson.create!(:syllabus_id => cours.id, :horaire => return_time(f.cell(line, 'AB'), f.cell(line, 'AC')), :flag_recurrent => true) unless (f.cell(line, 'AB').to_s.empty? || f.cell(line, 'AC').to_s.empty?)
            end
          end
          end

          cours.save!
        end

      newcours << cours.id
    end
    import.destroy


  end


end
