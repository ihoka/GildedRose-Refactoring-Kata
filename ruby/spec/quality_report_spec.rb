RSpec.describe QualityReport do
  describe '#add_day' do
    it 'adds a day to the report' do
      report = QualityReport.new
      report.add_day(1, [])
      expect(report.days.size).to eq(1)
    end
  end

  describe '#write' do
    around do |example|
      tmpdir = Dir.mktmpdir do |dir|
        Dir.chdir(tmpdir) do
          example.run
        end
      end
    end

    it 'writes the report to a file' do
      report = QualityReport.new
      report.add_day(1, [])
      report.write('report.csv')
      expect(File.exist?('report.csv')).to be_truthy
    end
  end
end
