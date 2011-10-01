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

		create_table :monsters do
			primary_key :id
			foreign_key :type_id, :types
			foreign_key :account_id, :accounts
			Integer :level
			Integer :hp
		end
	end

	down do
		drop_table :types
		drop_table :accounts
	end
end
