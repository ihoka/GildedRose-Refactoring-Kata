require 'tempfile'

RSpec.describe QualityReport do
  describe '#add_day' do
    it 'adds a day to the report' do
      report = QualityReport.new
      report.add_day(1, [])
      expect(report.days.size).to eq(1)
    end
  end

  describe '#average_quality' do
    it 'returns the average quality of the items' do
      report = QualityReport.new
      items = [
        Item.new('foo', 1, 1),
        Item.new('bar', 1, 2)
      ]
      report.add_day(1, items)
      expect(report.average_quality(items)).to eq(1.5)
    end
  end

  describe '#report' do
    let(:items) { [Item.new('foo', 1, 1), Item.new('bar', 1, 2)] }

    it 'returns the report' do
      report = QualityReport.new
      report.add_day(1, items)
      expect(report.report).to eq([{ day: 1, average_quality: 1.5 }])
    end
  end

  describe '#write' do
    let(:tmpfile) { Tempfile.new('report.csv') }

    it 'writes the report to a file' do
      report = QualityReport.new
      report.add_day(1, [])
      report.write(tmpfile.path)
      expect(File.read(tmpfile.path)).to match(/day,average_quality/)
    end
  end
end
