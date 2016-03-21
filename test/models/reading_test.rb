require 'test_helper'

class ReadingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "day#HourlyAverages" do
    sample_readings =  [
      [20, 40, 60], # 00
      [30, 40, 50], # 01
      [10, 20, 30], # 02
      [00, 30, 60], # 03
      [80, 90, 100], # 04
      [20, 60, 100], # 05
      [10, 50, 90], # 06
      [20, 20, 20], # 07
      [20, 20, 20], # 09
      [20, 20, 20], # 09
      [20, 20, 20], # 10
      [20, 20, 20], # 11
      [20, 20, 20], # 12
      [20, 20, 20], # 13
      [20, 20, 20], # 14
      [20, 20, 20], # 15
      [20, 20, 20], # 16
      [20, 20, 20], # 17
      [20, 20, 20], # 18
      [20, 20, 20], # 19
      [20, 20, 20], # 20
      [20, 20, 20], # 21
      [20, 20, 20], # 22
      [20, 20, 20], # 23
    ]

    today = Time.now
    Timecop.freeze(today)

    sample_readings.each_with_index do |readings_raw, hour|
      created_at = today.change(hour: hour, minutes: 30)

      Timecop.freeze(created_at)

      readings_raw.each do |raw|
        Reading.create(raw: raw).to_s
      end
    end

    Timecop.return

    hourly_averages = Reading.hourly_averages(today)

    first  = hourly_averages.first
    second = hourly_averages.second

    # Check order
    assert first[:hour] < second[:hour], 'order should be ascending'

    # Compatibe type for JSON module
    assert_equal Array, hourly_averages.class, '#all should return a simple array'

    # Exact number of holders
    assert_equal 24, hourly_averages.size, 'should be a total of 24 results'

    # Check each average
    0..23.times do |hour|
      readings_raw = sample_readings[hour]
      avg = readings_raw.inject{ |sum, el| sum + el } / readings_raw.size
      assert_equal(
        avg,
        hourly_averages[hour][:raw_average],
        "should return avg of #{avg} for hour #{hour}"
      )
    end
  end
end
