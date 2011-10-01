# encoding: utf-8
class Account < Sequel::Model
	one_to_many :monsters
end
