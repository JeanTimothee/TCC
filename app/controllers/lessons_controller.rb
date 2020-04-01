class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    @students = Student.all
    @lessons_c1 = Lesson.where(court: 1)
    @lessons_c2 = Lesson.where(court: 2)
    @lessons_c3 = Lesson.where(court: 3)
    @lessons_c4 = Lesson.where(court: 4)
    @lessons_c5 = Lesson.where(court: 5)
    @monday_lessons = Lesson.where(start_time: ("1996-01-01 09:00:00".."1996-01-01 20:00:00"))
    @tuesday_lessons = Lesson.where(start_time: ("1996-01-02 09:00:00".."1996-01-02 20:00:00"))
    @wednesday_lessons = Lesson.where(start_time: ("1996-01-03 09:00:00".."1996-01-03 20:00:00"))
    @thursday_lessons = Lesson.where(start_time: ("1996-01-04 09:00:00".."1996-01-04 20:00:00"))
    @friday_lessons = Lesson.where(start_time: ("1996-01-05 09:00:00".."1996-01-05 20:00:00"))
    @saturday_lessons = Lesson.where(start_time: ("1996-01-06 09:00:00".."1996-01-06 20:00:00"))
  end
end
