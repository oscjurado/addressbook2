require 'active_record'
require 'i18n'

puts "Establishing connection..."
ActiveRecord::Base.establish_connection({
  adapter:  "sqlite3",
  database: "addressbook.db"
})

puts "Connected!"