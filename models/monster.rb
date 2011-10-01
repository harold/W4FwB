# encoding: utf-8
class Monster < Sequel::Model
	many_to_one :account
	many_to_one :type
end
