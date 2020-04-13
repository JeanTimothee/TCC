class StudentsController < ApplicationController

  def index
    @lessons = Lesson.all
    @students = Student.all
    @students_level_filter = []
    @students_age_filter = []

    # search params
    if params[:level].present?
      level_query = params[:level].map do |level|
        LEVEL_NUMBER[level]
      end
      @students = @students.where(level: level_query)
    end

    if params[:age].present?
        @students = @students.where(age: params[:age])
    end

    # filters collections
    @ages = @students.map do |student|
     student.age
    end
    @ages.uniq!.sort!
    nb_levels = @students.map do |student|
      student.level
    end
    nb_levels.uniq!.delete(nil)
    @levels = nb_levels.sort!.map do |level|
      NUMBER_LEVEL[level]
    end
  end

end
