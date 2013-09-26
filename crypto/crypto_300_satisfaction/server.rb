require 'socket'
require 'openssl'
require './bf.rb'
require './rsa_keys.rb'
require './the_flag.rb'

def crc32(str)
  mask = 0x04C11DB7
  crc = 0
  str.bytes.each do |byte|
    byte.to_s(2).rjust(8,"0").each_char do |bit|
      h_crc_bit = ( (( crc & 0x80_00_00_00) != 0) ? 1 : 0)
      h_byte_bit = bit.to_i
      if  h_crc_bit == h_byte_bit
        crc = ((crc << 1)^mask) & 0xffffffff
      else
        crc = (crc << 1) & 0xffffffff
      end
    end
  end
  return crc
end

def valid?(code, cert)
  return false unless code =~ /\A[\[\]+\-\.<> ]+\Z/
  return false unless cert =~ /\A\d+\Z/
  sig = cert.to_i
  crc = crc32(code)
  test = crc.to_bn.mod_exp($d, $n)
  return sig == test
end

Signal.trap("CHLD") {Process.wait() rescue nil}

Thread.abort_on_exception =true
server = TCPServer.new 2000 # Server bind to port 2000

loop do
  client = server.accept    # Wait for a client to connect
  puts "client connected"
  fork do
    begin
      client.puts "welcome to the Brainfuck Execution As A Service Cloud"
      client.puts "please submit your properly RSA signed brainfuck code"
      code = client.gets.chomp
      puts "got code #{code.inspect}"
      cert = client.gets.chomp
      puts "got cert #{cert.inspect}"
      valid_cert =  valid?(code,cert)
      5.times { sleep(rand); }
      if(valid_cert)
        puts "got valid code: #{code.inspect}"
        ruby_code = bfdo(code)
        puts "got some ruby code: #{ruby_code.inspect}"
        client.puts eval(ruby_code)
      else
        puts "uupps signature failed"
        client.puts "unfortunately the certificate seems to be wrong"
      end
    ensure
      puts "killing client"
      client.close
    end
  end
end
