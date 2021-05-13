
class ApplicationService
  def self.call(*params)
    new(*params).call
  end
end

#OR 

#if you have a block you want to work with
class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end
end
#To remove the need to call service classes with the `new` keyword you can inherit this class and use;

as so;
class AllSongsQuery < ApplicationQuery
  ...
end

#Instead of :
require  AllSongsQuery
@songs = AllSongsQuery.new.call(all_songs_params)


#You have :
@songs = AllSongsQuery.call(all_songs_params)

#which is cleaner
