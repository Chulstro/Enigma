require './lib/enigma'

puts "Insert file for encryption"
file = gets.chomp
text = File.open(file, "r")
message = text.read
enigma = Enigma.new
puts "Name a destination for your encryption"
new_file = gets.chomp
encryption = File.open(new_file, 'w')
encryption.write(enigma.encrypt(message)[:encryption])

puts "Created #{new_file} with the key of #{enigma.key} and date of #{enigma.date}"
