
=begin
Model names are singular, because an instantiated model represents a single data record.
To help remember this convention, think of how you would call the model's constructor: 
we want to write
=end

Article.new(...)
Article.create!(...)
not 
Articles.new(...)
Articles.create!(...)
