require_relative 'lib/connect.rb'
require_relative 'lib/models.rb'	

#displayed at program initialization
def menu
	puts "Select an option: \n
	1. Create new contact \n
	2. Search \n
	3. Quit \n"
	return gets.chomp
end

	#creates entry with phone and email
def create_entry
	#creates initial address entry
	puts "Please enter first name: "
	fname = gets.chomp.to_s

  puts "Please enter last name: "
 	lname = gets.chomp.to_s 

 	entry = Addressentry.new({first_name: fname, last_name: lname})

 		#phone number entry
 	puts "Would you like to give this entry a phone number? Enter Y or N \n"
 	phone_response = gets.chomp.upcase
 	
		#loops until user inputs N
 	until phone_response == "N" do
 		p = create_phone()
 		entry.phonenumbers.push p
 		puts "Would you like to add another number?"
 		phone_response = gets.chomp.upcase
 	end

 		#email entry
 	email_response = gets.chomp

 	until email_response == "N" do 
 		e = create_email()
 		entry.emails.push e
 		puts "Would you like to add another email?"
 		email_response = gets.chomp.upcase
 	end
 	entry.save!
 	puts "entry saved!"
end

	#method to create phone number object
def create_phone
  puts "Please enter phone category: "
  	cat = gets.chomp
  puts "Please enter phone number: "
  	dig = gets.chomp

  phone = Phonenumber.new({category: cat, digits: dig})
end

	#method to create email object
def create_email  
  puts "Please enter email category:"
  	cat = gets.chomp
  puts "Please enter email: "
  	ad = gets.chomp
  email = Email.new({category: cat, address: ad})
end

	#search method using last name
def search
	puts "Search for last name: \n"
	search_name = gets.chomp
	puts 
	@result = Addressentry.where(
			last_name: search_name
		)
	puts result
end

create = "1"
search = "2"
quit = "3"

selection = menu
until selection == quit do 
	if selection == create
		entry = create_entry()
	elsif selection == search
		search()
	end

	selection = menu
end
