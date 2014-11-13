require 'active_record'

class Phonenumber < ActiveRecord::Base
	validates :category,
						presence: true

	validates :digits,
						presence: true
	belongs_to :addressentry
end