require 'active_record'

class Addressentry < ActiveRecord::Base
	validates_presence_of :first_name, :last_name

	has_many :phonenumbers
	has_many :emails

end