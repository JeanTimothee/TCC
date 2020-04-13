class StudentsController < ApplicationController

  def index
    @lessons = Lesson.all
    @students = Student.all

    # search params
    @students = Student.search_by_first_last_name(params[:query]) if params[:query].present?
    if params[:level].present?
      level_query = params[:level].map do |level|
        LEVEL_NUMBER[level]
      end
      @students = @students.where(level: level_query)
    end
    @students = @students.where(age: params[:age]) if params[:age].present?
    @students = Student.all if @students.count == 0

    # filters collections
    if @students.count > 1
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
      @students = @students.order(:last_name)
    else
      @ages = @students[0].age
      @levels = NUMBER_LEVEL[@students[0].level]
    end
  end
end
