if @@user_class.is_a?(Class)
      raise "Spree.user_class MUST be a String or Symbol object, not a Class object."
   elsif @@user_class.is_a?(String) || @@user_class.is_a?(Symbol)
      @@user_class.to_s.constantize
end


=begin

The is_a that is implemented like so in the ruby documents assuming the def is_a function is used to check time-based classes;

def is_a(klass)
   klass === ::Time || super
end

Super keeps going up the chain on parents to find the method exising in any of those classes
Symbols are indentifiers. 

Next we see the use on constantize I like this article that shows the security issues this has http://gavinmiller.io/2016/the-safesty-way-to-constantize/

Here we get creative with it https://teamgaslight.com/blog/getting-creative-with-constantize-in-ruby-on-rails
=end 
