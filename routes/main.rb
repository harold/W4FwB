class MyApp < Sinatra::Application
	COOKIE_NAME = "W4FwB-login"

	get "/" do
		@title = "Welcome to W4FwB"
		@email_md5 = Digest::MD5.hexdigest(@account[:email])
		haml :main
	end

	get '/login' do
		@title = "Log in to W4FwB"
		haml :login
	end

	post '/login' do
		email    = params[:email]
		password = hash_password( params[:password])
		@account = Account[email:email, password:password]
		if @account
			set_cookie(COOKIE_NAME,email,password)
			redirect '/'
		else
			flash[:notice] = "Login failed - try again..."
			redirect '/login'
		end
	end

	get "/signup" do
		@title = "Sign up for W4FwB"
		haml :signup
	end

	post "/signup" do
		if "FwB" != params[:signupcode] then
			flash[:notice] = "Sign up failed - try again?"
			redirect '/signup'
		end

		email    = params[:email]
		password = hash_password( params[:password] )
		nickname = params[:nickname]
		@account = Account[email:email]

		if @account
			redirect '/'
		else
			Account.create(email:email,password:password,nickname:nickname)
			@account = Account[email:email,password:password]
			set_cookie(COOKIE_NAME,email,password)
			redirect '/'
		end
	end

	get '/logout/?' do
		set_cookie(COOKIE_NAME,'','')
		redirect '/'
	end

	post '/word' do
		word = params[:word]
		if is_word? word then
			flash[:notice] = "#{word} is a word"
			redirect '/'
		else
			flash[:notice] = "#{word} is _NOT_ a word"
			redirect '/'
		end
	end
end
