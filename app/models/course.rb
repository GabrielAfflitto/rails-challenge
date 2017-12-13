class Course < ApplicationRecord
  has_many :groupings, :dependent => :destroy
  has_many :students, :through => :groupings

  
end
