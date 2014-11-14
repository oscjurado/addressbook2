require 'active_record'
require 'i18n'


puts "\n 						Welcome to Addressbook2.0 \n
			Connecting to the database..."
ActiveRecord::Base.establish_connection({
  adapter:  "sqlite3",
  database: "addressbook.db"
})

puts "Connected"

