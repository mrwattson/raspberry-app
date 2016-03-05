require 'serialport'
require 'pg'

db = PG::Connection.new(
  host: 'localhost',
  dbname: 'mrwattson',
  user: 'matismasters',
  password: 'matismasters'
)

port_str = "/dev/cu.usbmodem1411"  #may be different for you
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

#just read forever
while true do
  while (i = sp.gets.chomp) do
    puts i
  end
end

sp.close
