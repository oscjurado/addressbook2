require_relative 'lib/connect.rb'
require_relative 'lib/models.rb'	


select_message = 
"\nSelect an entry from the above list " 

def menu
	puts "Select an option: \n
	1. Create new contact \n
	2. View contact \n
	3. Delete contact \n
	4. Quit \n"
	return gets.chomp
end

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
def print_list(collection)
	collection.each_with_index { |entry, index| puts ("#{index} ") + "#{entry.first_name} " + "#{entry.last_name}"}
end

def search ()
	if collection.count == 0
		puts "No entries to search. Try adding a contact."
	else
		puts "Searching by last name. \n
					Please enter search: \n"
	end
end


create = "1"
search = "2"
quit = "3"

selection = menu
until selection == quit do 
	if selection == create
		entry = create()
		entry_collection.push entry
		entry_collection.sort_by! { |n| n.last_name.downcase }	
	else selection == view
		search()
	end

	selection = menu
end
