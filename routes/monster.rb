class MyApp < Sinatra::Application
	get "/monster/create" do
		@title = "Create a Monster"
		@types = DB[:types].all
		haml :create_monster
	end

	post "/monster/create" do
		DB.transaction do
			m = Monster.create( type_id: params[:type].to_i,
			                    account_id: @account.pk,
			                    level: 1,
			                    hp: 10 )
			tops = [ 4, 8, 12, 16, 20, 24, 26, 26 ]
			tops.each_with_index do |top, i|
				Letter.create( monster_id:m.pk,
				               type_id:i==0 ? m.type.pk : nil,
				               letter:get_letter( top ),
				               level:i==tops.length-1 ? 2 : 1 )
			end
		end
		redirect "/"
	end
end
