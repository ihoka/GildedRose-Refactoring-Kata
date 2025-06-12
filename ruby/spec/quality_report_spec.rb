require 'tempfile'

RSpec.describe QualityReport do
  describe '#add_day' do
    it 'adds a day to the report' do
      report = QualityReport.new
      report.add_day(1, [])
      expect(report.days.size).to eq(1)
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
