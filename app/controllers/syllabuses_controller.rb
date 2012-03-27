class SyllabusesController < ApplicationController
  def index
        @syllabuses = Syllabus.all

        respond_to do |format|
          format.html # index.html.erb
          format.json { render :json => @syllabuses }
        end
      end
end
