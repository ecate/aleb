# -*- coding: utf-8 -*-
module LessonsHelper
  #return a list of 4 lessons with label "coup de coeur" - used in lessons#index for div "coup de coeur"
  def lessonscoupdecoeur
    @lessons_cdc= []
    @cours= Syllabus.find_all_by_label_id(Label.find_by_name("Coup de coeur").id)

    @cours.each do |cours|
      cours.lessons.each do |less|
        @lessons_cdc << less
        break if @lessons_cdc.count > 3
      end
      break if @lessons_cdc.count > 3
    end
    return @lessons_cdc
  end
end
