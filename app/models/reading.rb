class Reading < ActiveRecord::Base
  S_RATIO = 31.02
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
end
