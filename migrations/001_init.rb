Sequel.migration do
	up do
		create_table :accounts do
			primary_key :id
			String :email
			String :password
			String :nickname
		end
	end

	down do
		drop_table :accounts
	end
end
