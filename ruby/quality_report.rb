require 'csv'

class QualityReport
  def initialize
    @days = []
  end

  attr_reader :days

  def add_day(day, items)
    item_copies = items.map { |item| Item.new(item.name, item.sell_in, item.quality) }
    @days << { day: day, items: item_copies }
  end

  def average_quality(items)
    items.map(&:quality).sum.to_f / items.size
  end

  def report
    @days.map { |day| { day: day[:day], average_quality: average_quality(day[:items]) } }
  end

  def write(filename)
    CSV.open(filename, 'w') do |csv|
      csv << %w[day average_quality]
      report.each do |day|
        csv << [day[:day], day[:average_quality]]
      end
    end
  end
end
