class QualityReport
  def initialize
    @days = []
  end

  attr_reader :days

  def add_day(day, items)
    @days << { day: day, items: items }
  end

  def write(filename)
    File.open(filename, 'w') do |file|
      file.write('day,average_quality')
    end
  end
end
