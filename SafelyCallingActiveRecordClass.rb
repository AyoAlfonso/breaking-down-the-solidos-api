#Use this 


class SplitUserNameFields < ActiveRecord::Migration
  class MigrationUser < ActiveRecord::Base
    self.table_name = :users
  end
  def up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    MigrationUser.find_each do |u|
      u.update!(
        :first_name => u.name.split(" ").first,
        :last_name => u.name.split(" ").last,
      )
    end
    remove_column :users, :name
  end
  #...
end


#Instead of this 

class SplitUserNameFields < ActiveRecord::Migration
  def up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    User.find_each do |u|
      u.update!(
        :first_name => u.name.split(" ").first,
        :last_name => u.name.split(" ").last,
      )
    end
    remove_column :users, :name
  end

  def down
    add_column :users, :name, :string
    User.find_each do |u|
      u.update!(
        :name => "#{u.first_name} #{u.last_name}"
      )
    end
    remove_column :users, :first_name
    remove_column :users, :last_name
  end
end

=begin
The reason this is working is because of the eager loading/bootstrapping of the contents of app which means 
the gems [e.g acts_as_paranoid ] that rewrite or wrap ActiveRecord for example will loose their effects outside the scope of app/

NB: Never reference your application’s ActiveRecord models from your migrations.

=end
