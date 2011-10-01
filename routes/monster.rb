class MyApp < Sinatra::Application
	get "/monster/create" do
		@title = "Create a Monster"
		@types = DB[:types].all
		haml :create_monster
	end

	post "/monster/create" do
		puts "==="
		puts params[:type]
		puts @account.pk
		puts "==="
		Monster.create( type_id: params[:type].to_i,
		                account_id: @account.pk,
		                level: 1,
		                hp: 10 )
		redirect "/"
	end
end
