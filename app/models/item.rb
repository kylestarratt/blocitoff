class Item < ActiveRecord::Base
  belongs_to :user

# want the days to change right...
  def days_left
    (DateTime.now.to_date - created_at.to_date).to_i
  end
  
end
