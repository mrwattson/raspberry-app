class Reading < ActiveRecord::Base
  attr_accessor :created_at

  S_RATIO = 36.25
  VOLTAGE = 230

  def cad_value
    raw * 0.0048
  end

  def amper
    (raw * S_RATIO)/1000
  end

  def kwatts
    watts/1000
  end

  def watts
    (VOLTAGE * amper)
  end

  def voltage
    VOLTAGE
  end

  def to_s
    "\r\n" +
    "------====== MrWattson ======------\r\n" +
    "\r\n" +
    "Voltaje: #{VOLTAGE}\r\n" +
    "Sensor: #{raw}\r\n" +
    "Amper: #{amper}\r\n" +
    "Watts: #{watts}\r\n" +
    "KWatts: #{kwatts}\r\n"
  end

  def costs
    Plan.all.map { |plan| plan.kwatts_to_cost(kwatts) }.flatten
  end

  def to_json
    {
      voltage: VOLTAGE,
      sensor: raw,
      amper: amper,
      watts: watts.to_s[0..3],
      kwatts: kwatts.to_s[0..3],
      costs: costs
    }.to_json
  end

  def self.print_all
    all.each do |reading|
      puts reading.to_s
    end
  end

  def self.hourly_averages(day)
    select("DATE_PART('hour', created_at) as created_hour, AVG(raw) as raw_average")
    .where('created_at > ? AND created_at < ?',
      Time.now.change(hour: 0, min: 0, seconds: 0) - 1.second,
      Time.now.change(hour: 23, min: 59, seconds: 59)
    )
    .group('created_hour')
    .order('created_hour asc').map do |result|
      {
        hour: result.created_hour,
        raw_average: result.raw_average,
        watts: (VOLTAGE * (result.raw_average * (S_RATIO/1000)))
      }
    end
  end
end
