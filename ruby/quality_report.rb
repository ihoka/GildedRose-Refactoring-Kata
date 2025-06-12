class QualityReport
  def initialize
    @days = []
  end

  attr_reader :days

  def add_day(day, items)
    @days << { day: day, items: items }
  end

  def average_quality(items)
    items.map(&:quality).sum.to_f / items.size
  end

  def report
    @days.map { |day| { day: day[:day], average_quality: average_quality(day[:items]) } }
  end

  def write(filename)
    File.open(filename, 'w') do |file|
      file.write('day,average_quality')
    end
  end
end
