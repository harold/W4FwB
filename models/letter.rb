# encoding: utf-8
class Letter < Sequel::Model
	many_to_one :monster
	many_to_one :type
end
