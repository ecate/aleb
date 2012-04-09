class LessonsController < ApplicationController

  def index
        @lessons = Lesson.all

        respond_to do |format|
          format.html # index.html.erb
          format.json { render :json => @lessons }
        end
  end

  def show
        @lesson = Lesson.find(params[:id])
          respond_to do |format|
            format.html # show.html.erb
            format.json { render :json => @lesson }
          end
      end
end
