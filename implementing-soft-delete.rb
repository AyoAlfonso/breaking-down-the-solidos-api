
=begin
Use us acts_as_paranoid gem
=end

#Steps 1:  Include in your model class 
#Step 2: Specify the field to be used for tracking deletese as so;
 
  def change 
      add_column :users, :deleted_at, :time
  end 
#You can use nornal string and boolean as so ; 'deleted' or as true and false but for time-based deletions and also a scope to carry out specific operations

time = Time.now

Paranoiac.deleted_after_time(time)
Paranoiac.deleted_before_time(time)

# Or roll it all up and get a nice window:
Paranoiac.deleted_inside_time_window(time, 2.minutes)


#Step 3 : Configure your gem to prevent default double tap to delete behaviour 

double_tap_destroys_fully: false
