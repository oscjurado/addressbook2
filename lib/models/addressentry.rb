require 'active_record'

class Addressentry < ActiveRecord::Base
	validates_presence_of :first_name, :last_name

	has_many :phonenumbers
	has_many :emails

def create
	puts "Please enter first name: "
	fname = gets.chomp.to_s

  puts "Please enter last name: "
 	lname = gets.chomp.to_s 

 	entry = Addressentry.create({first_name: fname, last_name: lname})


  puts "Please enter phone category: "
  	cat = gets.chomp
  puts "Please enter phone number: "
  	dig = gets.chomp

  phone = Phonenumber.create({category: cat, digits: dig})
  	entry.phonenumbers.push phone
  
  puts "Please enter email category:"
  	cat = gets.chomp
  puts "Please enter email: "
  	ad = gets.chomp
  email = Email.new({category: cat, address: ad})
  	entry.emails.push email
  
  return entry
end

end