# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'roo'

puts "Destroying all Students..."

Student.destroy_all

puts "----------"
puts ">>>> Done!"
puts ""

puts "Creating Students..."

xlsx = Roo::Spreadsheet.open('./data/fichier_eleves.xlsx')
xlsx = Roo::Excelx.new('./data/fichier_eleves.xlsx')


xlsx.drop(2).each do |row|
    last_name = row[1]
    first_name = row[2]
    mobile_phone = row[3]
    fixed_phone = row[4]
    birth_date = row[5]
    email = row[6]
    level = row[15]

    case level
    when "C-"
      level = 1
    when "C"
      level = 2
    when "CC+"
      level = 3
    when "C+"
      level = 4
    when "C+b-"
      level = 5
    when "C+B-"
      level = 6
    when "B-"
      level = 7
    when "B-B"
      level = 8
    when "B"
      level = 9
    when "BB+"
      level = 10
    when "B+"
      level = 11
    when "A-"
      level = 12
    when "A"
      level = 13
    when "A 30/5"
      level = 14
    when "A 30/4"
      level = 15
    when "A 30/3"
      level = 16
    when "A 30/2"
      level = 17
    when "A 30/1"
      level = 18
    when "A 30"
      level = 19
    when "A 15/5"
      level = 20
    when "A 15/4"
      level = 21
    when "A 15/4"
      level = 22
    when "A 15/3"
      level = 23
    when "A 15/2"
      level = 24
    when "A 15/1"
      level = 25
    when "A 15"
      level = 26
    end

    student = Student.new(last_name: last_name, first_name: first_name, mobile_phone: "0#{mobile_phone}", fixed_phone: ("0#{fixed_phone}" if fixed_phone.present?), birth_date: birth_date, email: email, level: level)
  unless row[12] == "out" || row[12] == "?" || row[12] == "out?"
    student.save
  end
end

puts "----------"
puts ">>>> Done!"
puts "#{Student.count} students created"
puts ""


puts "Destroying all Teachers..."
Teacher.destroy_all
puts "----------"
puts ">>>> Done!"
puts ""

puts "Creating Teachers..."

teacher1 = Teacher.create!(first_name: "Christophe",last_name: "REGIS", nickname: "Christophe", phone: "0607447714")

teacher2 = Teacher.create!(first_name: "Lotfi",last_name: "HARIZI", nickname: "Lotfi", phone: "0603887640")

teacher3 = Teacher.create!(first_name: "Anthony",last_name: "SEBBAGH", nickname: "Anthony", phone: "0633846805")

teacher4 = Teacher.create!(first_name: "Matthieu",last_name: "SMERDJEAN", nickname: "Matthieu SM", phone: "0615053400")

teacher5 = Teacher.create!(first_name: "Kamel",last_name: "DJELILI", nickname: "Kamel", phone: "0660974256")

teacher6 = Teacher.create!(first_name: "Matthieu",last_name: "DESURMONT", nickname: "Matthieu DE", phone: "0762261506")

teacher7 = Teacher.create!(first_name: "Philippe",last_name: "BERTRAND", nickname: "Philippe", phone: "0610920734")

teacher8 = Teacher.create!(first_name: "Matthieu",last_name: "SIMON", nickname: "Matthieu SI", phone: "0659372654")

teacher9 = Teacher.create!(first_name: "Jean-Pierre",last_name: "ANTONIO", nickname: "Jean-Pierre", phone: "0680725444")

teacher10 = Teacher.create!(first_name: "Vadim",last_name: "FONS", nickname: "Vadim", phone: "0634694375")


puts "----------"
puts ">>>> Done!"
puts "#{Teacher.count} teachers created"
puts ""


puts "Destroying all Lessons..."
Lesson.destroy_all
puts "----------"
puts ">>>> Done!"
puts ""

puts "Creating Lessons..."

lesson1 = Lesson.new(court: 4, start_time: "1996-01-02 09:45", end_time:"1996-01-02 10:30")
lesson1.teacher = teacher1
lesson1.save!

lesson2 = Lesson.new(court: 4, start_time: "1996-01-02 10:30", end_time:"1996-01-02 11:15")
lesson2.teacher = teacher1
lesson2.save!

lesson3 = Lesson.new(court: 4, start_time: "1996-01-02 11:15", end_time:"1996-01-02 12:00")
lesson3.teacher = teacher1
lesson3.save!

lesson4 = Lesson.new(court: 4, start_time: "1996-01-02 12:00", end_time:"1996-01-02 12:45")
lesson4.teacher = teacher1
lesson4.save!

lesson5 = Lesson.new(court: 4, start_time: "1996-01-02 16:30", end_time:"1996-01-02 17:15")
lesson5.teacher = teacher1
lesson5.save!

lesson6 = Lesson.new(court: 4, start_time: "1996-01-02 17:15", end_time:"1996-01-02 18:00")
lesson6.teacher = teacher1
lesson6.save!

lesson7 = Lesson.new(court: 4, start_time: "1996-01-02 18:00", end_time:"1996-01-02 19:00")
lesson7.teacher = teacher1
lesson7.save!

lesson8 = Lesson.new(court: 4, start_time: "1996-01-02 19:00", end_time:"1996-01-02 20:00")
lesson8.teacher = teacher1
lesson8.save!

lesson9 = Lesson.new(court: 4, start_time: "1996-01-02 20:00", end_time:"1996-01-02 21:00")
lesson9.teacher = teacher1
lesson9.save!

lesson1 = Lesson.new(court: 5, start_time: "1996-01-02 15:00", end_time:"1996-01-02 15:45")
lesson1.teacher = teacher2
lesson1.save!

lesson2 = Lesson.new(court: 5, start_time: "1996-01-02 15:45", end_time:"1996-01-02 16:30")
lesson2.teacher = teacher2
lesson2.save!

lesson3 = Lesson.new(court: 5, start_time: "1996-01-02 16:30", end_time:"1996-01-02 17:15")
lesson3.teacher = teacher2
lesson3.save!

lesson4 = Lesson.new(court: 5, start_time: "1996-01-02 17:15", end_time:"1996-01-02 18:00")
lesson4.teacher = teacher2
lesson4.save!

lesson5 = Lesson.new(court: 5, start_time: "1996-01-02 18:00", end_time:"1996-01-02 19:00")
lesson5.teacher = teacher2
lesson5.save!

puts "----------"
puts ">>>> Done!"
puts "#{Lesson.count} lessons created"
puts ""
