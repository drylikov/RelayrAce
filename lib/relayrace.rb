
require 'serialport'
require 'system_timer'

class RelayrAce
  def initialize(port, logger = nil)
    @port = port
    @logger = logger
  end
  
  def get_relay(relay)
    raise "Reads aren't working yet"
  end
  
  def set_relay(relay, value)
    send_cmd("REL#{relay}.#{(value)? 'ON' : 'OFF'}")
  end
  
  def toggle_relay(relay)
    send_cmd("REL#{relay}.TOGGLE")
  end
  
  def set_all_relays(value)
    send_cmd("RELS.#{(value)? 'ON' : 'OFF'}")
  end

  def get_channel(channel)
    raise "Reads aren't working yet"
  end
  
  def set_channel(channel, value)
    send_cmd("CH#{channel}.#{(value)? 'ON' : 'OFF'}")
  end
  
  def toggle_channel(channel)
    send_cmd("CH#{channel}.TOGGLE")
  end
  
  def send_cmd(cmd)
    begin
      SystemTimer.timeout_after(10) do
        SerialPort.open(@port, 115200, 8, 1, SerialPort::NONE) do |tty|
          tty.write("\r\n")
          2.times { tty.getc == ':' }
          tty.write("#{cmd}\r\n")
        end
      end
    rescue Timeout::Error
      @logger.warn "Failed to execute operation #{cmd}" if @logger    
    end
  end  
end