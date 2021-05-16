
=begin
The second argument of add_reference is a reference (column name without _id, hence usually singular), 
whereas that of add_foreign_key is a table name (hence usually plural).
=end


#Foreign key And Foreign Refrence

add_reference   :articles, :author, foreign_key: true

add_column      :articles, :author_id, :bigint, null: true
add_foreign_key :articles, :authors
add_index       :articles, :author_id

#Using the following command  

bin/rails g model Comment body:text commentable:references{polymorphic}  

#if you don't add 
:polymorphic
#in the above or in def change function e.g
add_reference(:products, :user, type: :string)

#instead of 
add_reference(:products, :supplier, polymorphic: true) 
#in the above polymorphic is false by default

#if you want to index the foreign key and 
add_reference(:products, :supplier, index: { unique: true })

#If you want to create a name index 
add_reference(:products, :supplier, index: { name: "my_supplier_index" })


#Will create the following migration:   
  class CreateComments < ActiveRecord::Migration  
    def change  
      create_table :comments do |t|  
        t.text :body  
        t.references :commentable, polymorphic: true, index: true
        t.timestamps null: false  
    end  
  end  
end  

#Helps prevent repeating this 
belongs_to :company
belongs_to :products
belongs_to :article

#https://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-add_reference
#https://culttt.com/2016/01/13/creating-polymorphic-relationships-in-ruby-on-rails
#https://stackoverflow.com/questions/52915025/add-foreign-key-vs-add-reference-in-rails
