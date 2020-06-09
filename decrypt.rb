require './lib/enigma'

text = File.open(ARGV[0], "r")
message = text.read
enigma = Enigma.new
encryption = File.open(ARGV[1], 'w')
encryption.write(enigma.decrypt(message, ARGV[2], ARGV[3])[:decryption])

puts "Created #{ARGV[1]} with the key of #{enigma.key} and date of #{enigma.date}"
