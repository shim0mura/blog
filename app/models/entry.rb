class Entry < ActiveRecord::Base
  default_scope :order => 'created_at DESC'
  paginates_per 5
  
  validates_presence_of :title, :path, :text
end
  
