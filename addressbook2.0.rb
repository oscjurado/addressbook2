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

 	entry = Addressentry.create({first_name: fname, last_name: lname})

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
 	puts "Would you like to add an email? Enter Y or N\n"
 	email_response = gets.chomp.upcase

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

  phone = Phonenumber.create({category: cat, digits: dig})
end

	#method to create email object
def create_email  
  puts "Please enter email category:"
  	cat = gets.chomp
  puts "Please enter email: "
  	ad = gets.chomp
  email = Email.create({category: cat, address: ad})
end

	#search method using last name
def search
	puts "Search for last name: \n"
	search_name = gets.chomp
	result = Addressentry.where(
			last_name: search_name
		)
	unless result.size == 1
		puts "\nFound #{result.size} matches"
	else puts "Found #{result.size} match"
	end

	#loops through results
	result.each do |r|
		puts "\nFirst Name: #{r.first_name}\n"
		puts "\nLast Name: #{r.last_name}\n"

		#loops through emails
		puts "\nEmails..\n"
		r.emails.each do |e|
			puts "  category: #{e.category} \n  address: #{e.address} \n"
		end

		puts "\nPhone numbers..\n"
		#loops through numbers
		r.phonenumbers.each do |p|
			puts "  category: #{p.category} \n  digits: #{p.digits} \n"
		end	
	end
	puts "Destroy Entries? Enter Y or N\n"
	choice = gets.chomp.downcase
	if choice == "y"
		if result.count > 1
			result.destroy_all
			puts "\n.....Entries destroyed...\n"
		end
	end
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
	else puts "\nOops. Incorrect input\n"
	end
	selection = menu
end
puts " Goodbye! \n #{Addressentry.count} entries saved in database."
