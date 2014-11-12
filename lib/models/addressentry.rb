require 'active_record'

class Addressentry < ActiveRecord::Base
	validates :firstname,
						presence: true
	validates :lastname,
						presence: true

	has_many :email
	has_many :phonenumbers

end