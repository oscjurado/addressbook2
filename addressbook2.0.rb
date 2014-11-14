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


def print_list(collection)
	collection.each_with_index { |entry, index| puts ("#{index} ") + "#{entry.first_name} " + "#{entry.last_name}"}
end


create = "1"
search = "2"
quit = "3"

selection = menu
until selection == quit do 
	if selection == create
		entry = Addressentry.create()
	else selection == view
		search()
	end

	selection = menu
end
