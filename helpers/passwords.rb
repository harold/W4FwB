# encoding: utf-8
require 'sinatra/base'

module Sinatra
	module PasswordHelpers
		def hash_password( password )
			salt = "yomamaain'tgotnorainbowtableforthismother"
			Digest::SHA1.hexdigest(password+salt)
		end
		
		def set_cookie(cookie_name, email, password)
			cookie_value = "#{email}::#{password}"
			response.set_cookie( cookie_name, {expires:Time.now+(10**6), value:cookie_value} )
		end
	end
	helpers PasswordHelpers
end
