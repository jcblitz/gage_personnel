class Job < ActiveRecord::Base
belongs_to :category
  validates_presence_of     :title, :description, :category
  validates_numericality_of :position
end
