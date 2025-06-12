describe GildedRose do
  describe 'Gold Master' do
    ITERATIONS = 100

    it 'is consistent with starting version' do
      fixture_path = File.expand_path('../gold_master.txt', __dir__)
      fixture_generator_path = File.expand_path('../texttest_fixture.rb', __dir__)

      actual_lines = `ruby #{fixture_generator_path} #{ITERATIONS}`.split("\n")
      expected_lines = File.read(fixture_path).split("\n")

      line_count = [actual_lines.count, expected_lines.count].max

      line_count.times do |num|
        actual = actual_lines[num].to_s
        expected = expected_lines[num]

        expect(actual).to eq(expected), <<~TXT
          LINE #{num}:
            expected: #{expected.inspect}
            got:      #{actual.inspect}
        TXT
      end
    end
  end
end
