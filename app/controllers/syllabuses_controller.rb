class SyllabusesController < ApplicationController
  def index
        @syllabuses = Syllabus.all

        respond_to do |format|
          format.html # index.html.erb
          format.json { render :json => @syllabuses }
        end
  end

  def show
        @syllabus = Syllabus.find(params[:id])
          respond_to do |format|
            format.html # show.html.erb
            format.json { render :json => @syllabus }
          end
      end
end
