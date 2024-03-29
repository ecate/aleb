class LessonsController < ApplicationController

  def index

    if ! @requested_date.nil?
      @lessons_date = Lesson.where('horaire > ? AND horaire < ?',@requested_date, @requested_date + 1.day)
      @q = @lessons_date.search(params[:q])
    else
      @q = Lesson.search(params[:q])
    end
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
    #bug_volontaire_pour_voir_le_contenu_de_q
    #on recupere la date demandee si elle a ete remplie
    # date en dehors de "q" car ransack ne gere pas les date range
    @requested_date= Date.parse(params['horaire_dateequals']) unless params['horaire_dateequals'].empty?

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
