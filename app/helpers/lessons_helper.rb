# -*- coding: utf-8 -*-
module LessonsHelper
  #return a list of 4 lessons with label "coup de coeur" - used in lessons#index for div "coup de coeur"
  def lessonscoupdecoeur
    @lessons_cdc= []
    @cours= Syllabus.find_all_by_label_id_and_flag_actif(Label.find_by_name("Coup de coeur").id, true)

    @cours.each do |cours|
      cours.lessons.where('horaire > ?', DateTime.now.beginning_of_day).each do |less|
        @lessons_cdc << less
        break if @lessons_cdc.count > 3
      end
      break if @lessons_cdc.count > 3
    end
    return @lessons_cdc
  end

  def lessonsactives
    @lessons_actives= []
    @lessons.each do |lesson|
      if (lesson.syllabus.flag_actif == true && lesson.horaire > DateTime.now.beginning_of_day)
        @lessons_actives << lesson
      end
    end
    return @lessons_actives
  end
end
