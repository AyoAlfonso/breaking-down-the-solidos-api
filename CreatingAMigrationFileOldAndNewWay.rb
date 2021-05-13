#Creating a column that doesn't allow null values, is a string, should be unique, allows a character size of 255ch [tinytext], should 

#creating

def change
	create_table :students do | t |
	  t.column :status_num, :integer, :limit => 225, :unique => true, :null => false 
	end
end

def self.up
	create_table :students do | t |
	  t.column :status_num, :integer, :limit => 225, :unique => true, :null => false 
	end
end

def self.down
	drop_table :students
end

#updating but in the old version of migration up and down format

def change
	add_column :students, :status_num, :integer, :limit => 225, :unique => true, :null => false 
end

def self.up
	add_column :students, :status_num, :integer, :limit => 225, :unique => true, :null => false 
end

def self.down
	remove_column :students, :status_num, :integer, :limit => 225, :unique => true, :null => false 
end

