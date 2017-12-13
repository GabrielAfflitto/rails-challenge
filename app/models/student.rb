class Student < ApplicationRecord
  has_many :addresses

  has_many :groupings, :dependent => :destroy
  has_many :courses, :through => :groupings

  attr_writer :course_names
  after_save :assign_courses

  def course_names
    @course_names || courses.map(&:name).join(' ')
  end

  private

  def assign_courses
    if @course_names
      self.courses = @course_names.split(/\,/).map do |name|
        if name[0..0]==" "
          name=name.strip
        end
        name=name.downcase
        Course.find_or_create_by_name(name)
      end
    end
  end

end
