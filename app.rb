# encoding: utf-8
require 'sinatra'
require 'haml'
require 'rack-flash'

require_relative 'minify_resources'
class MyApp < Sinatra::Application
	enable :sessions
	use Rack::Flash

	configure :production do
		set :haml,        { ugly:true }
		set :clean_trace, true
		set :css_files,   :blob
		set :js_files,    :blob
		MinifyResources.minify_all
	end

	configure :development do
		set :css_files, MinifyResources::CSS_FILES
		set :js_files,  MinifyResources::JS_FILES
	end

	helpers do
		include Rack::Utils
		alias_method :h, :escape_html
	end

	before do
		path = request.path_info
		unless path[/login|signup/i] or path[/(ico|css|js|png)$/]
			cookie = request.cookies[COOKIE_NAME]
			if cookie
				email, password = cookie.split("::")
				@account = Account[email:email, password:password]
			end
			unless @account
				redirect '/login'
			end
		end
	end
end

require_relative 'helpers/init'
require_relative 'models/init'
require_relative 'routes/init'

class MyApp < Sinatra::Application
	run!
end
