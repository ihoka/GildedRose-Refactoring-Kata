class QualityReport
  def initialize
    @days = []
  end

  attr_reader :days

  def add_day(day, items)
    @days << { day: day, items: items }
  end
end
