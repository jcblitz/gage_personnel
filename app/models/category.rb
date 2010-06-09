class Category < ActiveRecord::Base
  has_many :job
  
  attr :jobs, true
end
