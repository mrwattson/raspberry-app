namespace :arduino do
  desc "Listen to Arduino port and write to DB"
  task listen: :environment do
    port_str = "/dev/cu.usbmodem1411"  #may be different for you
    baud_rate = 9600
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE

    sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

    #just read forever
    while true do
      while (read = sp.gets.chomp) do
        reading = Reading.create(raw: read.to_f)
        puts reading.to_s
      end
    end

    sp.close
  end
end
