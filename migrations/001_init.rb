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

		create_table :letters do
			primary_key :id
			foreign_key :monster_id
			foreign_key :type_id, null:true
			String :letter
			Integer :level
		end
	end

	down do
		drop_table :letters
		drop_table :monsters
		drop_table :types
		drop_table :accounts
	end
end
