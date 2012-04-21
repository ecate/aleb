class SyllabusFilter
  def initialize(relation)
      @relation = relation
    end

    def restrict(restrictions)
      published! if restrictions.try(:[], :published) == '1'
      this_week! if restrictions.try(:[], :recent) == '1'

      @relation
    end

    protected

    def published!
      where('published')
    end

    def this_week!
      where('created_at > ?', 1.week.ago)
    end

    def where(*a)
      @relation = @relation.where(*a)
    end
end