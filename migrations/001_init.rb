Sequel.migration do
	up do
		create_table :accounts do
			primary_key :id
			String :email
			String :password
			String :nickname
		end

		create_table :types do
			primary_key :id
			String :name
		end
		%w{ Fire Ice Grass Electric Water }.each { |t| self[:types] << { name: t } }
	end

	down do
		drop_table :types
		drop_table :accounts
	end
end
