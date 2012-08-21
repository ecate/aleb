class LessonsController < ApplicationController

  def index
    @q = Lesson.search(params[:q])
    @lessons = @q.result(:distinct => true).order("horaire").page(params[:page]).per(11)
  end

  def show
        @lesson = Lesson.find(params[:id])
          respond_to do |format|
            format.html # show.html.erb
            format.json { render :json => @lesson}
          end
  end

  def search
    pourafficher le bug
    index
    render :index
  end

  def register
    #lesson.flag_interne = false
    @lesson = Lesson.find(params[:id])

    #redirect to external link
    redirect_to @lesson.syllabus.lien
  end

  def register_interne
    @lesson = Lesson.find(params[:id])
  end

end
