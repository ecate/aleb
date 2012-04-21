class LessonsController < ApplicationController

  def index
    @q = Lesson.search(params[:q])
    @lessons = @q.result(:distinct => true).order("horaire").page(params[:page]).per(12)

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

  def search
    index
    render :index
  end

end
