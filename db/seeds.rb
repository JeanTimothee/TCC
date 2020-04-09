# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'roo'

puts "Destroying User..."
User.destroy_all
puts "----------"
puts ">>>> Done!"
puts ""
puts "Creating User..."
User.create!(email: "christopheregis@free.fr", password: "christopheregis@free.fr")
puts "----------"
puts ">>>> Done!"
puts ""


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

puts "Destroying all Lessons..."
Lesson.destroy_all
puts "----------"
puts ">>>> Done!"
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



puts "Creating Lessons..."

  lesson1 = Lesson.new(court: 4, start_time: "1996-01-03 09:45", end_time:"1996-01-03 10:30")
  lesson1.teacher = teacher1
  lesson1.save!

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson1
  student_lesson.student = Student.find_by(last_name: "VEVER")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson1
  student = Student.find_by(last_name: "GELIS")
  student_lesson.student = student
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson1
  student_lesson.student = Student.find_by(last_name: "BOUKHOBZA")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson1
  student_lesson.student = Student.find_by(last_name: "GOBERT", first_name: "vincent")
  student_lesson.save



  lesson2 = Lesson.new(court: 4, start_time: "1996-01-03 10:30", end_time:"1996-01-03 11:15")
  lesson2.teacher = teacher1
  lesson2.save!

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson2
  student_lesson.student = Student.find_by(last_name: "BIGNON", first_name: "andrée")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson2
  student_lesson.student = Student.find_by(last_name: "SAINT LEGER", first_name: "adèle")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson2
  student_lesson.student = Student.find_by(last_name: "de SMEDT", first_name: "hadrien")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson2
  student_lesson.student = Student.find_by(last_name: "GOBERT", first_name: "arnaud")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson2
  student_lesson.student = Student.find_by(last_name: "GAUTIER", first_name: "emma")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson2
  student_lesson.student = Student.find_by(last_name: "GAUTIER", first_name: "gregoire")
  student_lesson.save

  lesson3 = Lesson.new(court: 4, start_time: "1996-01-03 11:15", end_time:"1996-01-03 12:00")
  lesson3.teacher = teacher1
  lesson3.save!

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson3
  student_lesson.student = Student.find_by(last_name: "WECKX", first_name: "timothée")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson3
  student_lesson.student = Student.find_by(last_name: "VANDROUX", first_name: "quentin")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson3
  student_lesson.student = Student.find_by(last_name: "ABARNOU", first_name: "augustin")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson3
  student_lesson.student = Student.find_by(last_name: "SULTAN", first_name: "jonathan")
  student_lesson.save


  lesson4 = Lesson.new(court: 4, start_time: "1996-01-03 12:00", end_time:"1996-01-03 12:45")
  lesson4.teacher = teacher1
  lesson4.save!

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson4
  student_lesson.student = Student.find_by(last_name: "DELEGUE", first_name: "celeste")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson4
  student_lesson.student = Student.find_by(last_name: "LAMBOTTE", first_name: "pia")
  student_lesson.save

  # student not parsed
  # student_lesson = StudentLesson.new
  # student_lesson.lesson = lesson4
  # student_lesson.student = Student.find_by(last_name: "SERNA.HILL", first_name: "james")
  # student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson4
  student_lesson.student = Student.find_by(last_name: "de MONTGOLFIER", first_name: "matthieu")
  student_lesson.save


  lesson5 = Lesson.new(court: 4, start_time: "1996-01-02 16:30", end_time:"1996-01-02 17:15")
  lesson5.teacher = teacher1
  lesson5.save!

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson5
  student_lesson.student = Student.find_by(last_name: "ROUX", first_name: "remi")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson5
  student_lesson.student = Student.find_by(last_name: "CROIXMARIE NICOUL")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson5
  student_lesson.student = Student.find_by(last_name: "BENKRIM")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson5
  student_lesson.student = Student.find_by(last_name: "TERRAS", first_name: "saskia")
  student_lesson.save


  lesson6 = Lesson.new(court: 4, start_time: "1996-01-02 17:15", end_time:"1996-01-02 18:00")
  lesson6.teacher = teacher1
  lesson6.save!

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson6
  student_lesson.student = Student.find_by(last_name: "KLETZINE")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson6
  student_lesson.student = Student.find_by(last_name: "ENGRAND", first_name: "joseph")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson6
  student_lesson.student = Student.find_by(last_name: "LEMEILLE", first_name: "timothée")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson6
  student_lesson.student = Student.find_by(last_name: "BOUKHOBZA", first_name: "gabriel")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson6
  student_lesson.student = Student.find_by(last_name: "SENEOR", first_name: "aaron")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson6
  student_lesson.student = Student.find_by(last_name: "EMSALEM")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson6
  student_lesson.student = Student.find_by(last_name: "HARFI", first_name: "romy")
  student_lesson.save


  lesson7 = Lesson.new(court: 4, start_time: "1996-01-02 18:00", end_time:"1996-01-02 19:00")
  lesson7.teacher = teacher1
  lesson7.save!

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson7
  student_lesson.student = Student.find_by(last_name: "FORGUES", first_name: "olympe")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson7
  student_lesson.student = Student.find_by(last_name: "RAQUILLET", first_name: "charlotte")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson7
  student_lesson.student = Student.find_by(last_name: "POTIGNON", first_name: "diane")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson7
  student_lesson.student = Student.find_by(last_name: "YATTAH")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson7
  student_lesson.student = Student.find_by(last_name: "TEYSSIER", first_name: "hadrien")
  student_lesson.save

  # student not parsed
  # student_lesson = StudentLesson.new
  # student_lesson.lesson = lesson6
  # student_lesson.student = Student.find_by(last_name: "JANICEK", first_name: "solal")
  # student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson7
  student_lesson.student = Student.find_by(last_name: "VIEGAS")
  student_lesson.save


  lesson8 = Lesson.new(court: 4, start_time: "1996-01-02 19:00", end_time:"1996-01-02 20:00")
  lesson8.teacher = teacher1
  lesson8.save!

  # student not parsed
  # student_lesson = StudentLesson.new
  # student_lesson.lesson = lesson6
  # student_lesson.student = Student.find_by(last_name: "BARDOT", first_name: "aurelie")
  # student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson8
  student_lesson.student = Student.find_by(last_name: "BEAU", first_name: "amelie")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson8
  student_lesson.student = Student.find_by(last_name: "CORNUAU")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson8
  student_lesson.student = Student.find_by(last_name: "DEVEAUX", first_name: "delphine")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson8
  student_lesson.student = Student.find_by(last_name: "GROUES", first_name: "severine")
  student_lesson.save


  lesson9 = Lesson.new(court: 4, start_time: "1996-01-02 20:00", end_time:"1996-01-02 21:00")
  lesson9.teacher = teacher1
  lesson9.save!

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson9
  student_lesson.student = Student.find_by(last_name: "GARBAN", first_name: "melanie")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson9
  student_lesson.student = Student.find_by(last_name: "de MONTGOLFIER", first_name: "pauline")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson9
  student_lesson.student = Student.find_by(last_name: "ROUVILLOIS", first_name: "marie")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson9
  student_lesson.student = Student.find_by(last_name: "FONTENEAU", first_name: "anne")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson9
  student_lesson.student = Student.find_by(last_name: "CROUZET", first_name: "marion")
  student_lesson.save


  lesson95 = Lesson.new(court: 4, start_time: "1996-01-02 21:00", end_time:"1996-01-02 22:00")
  lesson95.teacher = teacher1
  lesson95.save!

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson95
  student_lesson.student = Student.find_by(last_name: "MEYER")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson95
  student_lesson.student = Student.find_by(last_name: "HACHEMIN")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson95
  student_lesson.student = Student.find_by(last_name: "de PIERREFEU")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson95
  student_lesson.student = Student.find_by(last_name: "LIZOT", first_name: "thomas")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson95
  student_lesson.student = Student.find_by(last_name: "LIZOT", first_name: "edouard")
  student_lesson.save


  lesson10 = Lesson.new(court: 2, start_time: "1996-01-02 15:00", end_time:"1996-01-02 15:45")
  lesson10.teacher = teacher2
  lesson10.save!

  # student not parsed
  # student_lesson = StudentLesson.new
  # student_lesson.lesson = lesson10
  # student_lesson.student = Student.find_by(last_name: "PRYSWA", first_name: "aaron")
  # student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson10
  student_lesson.student = Student.find_by(last_name: "ATTIÈ", first_name: "théo")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson10
  student_lesson.student = Student.find_by(last_name: "PERRIN", first_name: "adrien")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson10
  student_lesson.student = Student.find_by(last_name: "DORIER")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson10
  student_lesson.student = Student.find_by(last_name: "GUIMARD", first_name: "oscar")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson10
  student_lesson.student = Student.find_by(last_name: "BISMUTH", first_name: "gabriel")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson10
  student_lesson.student = Student.find_by(last_name: "BISCARRAT", first_name: "Jules")
  student_lesson.save


  lesson11 = Lesson.new(court: 2, start_time: "1996-01-02 15:45", end_time:"1996-01-02 16:30")
  lesson11.teacher = teacher2
  lesson11.save!

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson11
  student_lesson.student = Student.find_by(last_name: "SCHINAZI", first_name: "eythan")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson11
  student_lesson.student = Student.find_by(last_name: "MADAR", first_name: "elona")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson11
  student_lesson.student = Student.find_by(last_name: "MADAR", first_name: "rony")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson11
  student_lesson.student = Student.find_by(last_name: "MARCIANO", first_name: "adam")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson11
  student_lesson.student = Student.find_by(last_name: "BANSAY", first_name: "david")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson11
  student_lesson.student = Student.find_by(last_name: "SAAD")
  student_lesson.save


  lesson12 = Lesson.new(court: 2, start_time: "1996-01-02 16:30", end_time:"1996-01-02 17:15")
  lesson12.teacher = teacher2
  lesson12.save!

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson12
  student_lesson.student = Student.find_by(last_name: "ADAM", first_name: "antoine")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson12
  student_lesson.student = Student.find_by(last_name: "PITRAT", first_name: "matthieu")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson12
  student_lesson.student = Student.find_by(last_name: "CARREGA", first_name: "paul")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson12
  student_lesson.student = Student.find_by(last_name: "DUPONT", first_name: "louis")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson12
  student_lesson.student = Student.find_by(last_name: "DEGUELDRE", first_name: "fabio")
  student_lesson.save

  # student not parsed
  # student_lesson = StudentLesson.new
  # student_lesson.lesson = lesson12
  # student_lesson.student = Student.find_by(last_name: "DEGUELDRE", first_name: "francesco")
  # student_lesson.save


  lesson13 = Lesson.new(court: 2, start_time: "1996-01-02 17:15", end_time:"1996-01-02 18:00")
  lesson13.teacher = teacher2
  lesson13.save!

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson13
  student_lesson.student = Student.find_by(last_name: "KERAUTRET", first_name: "sacha")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson13
  student_lesson.student = Student.find_by(last_name: "LEVY ZAUBERMAN")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson13
  student_lesson.student = Student.find_by(last_name: "BORYS-GUILLEBAUD", first_name: "gabriel")
  student_lesson.save

  # student not parsed
  # student_lesson = StudentLesson.new
  # student_lesson.lesson = lesson13
  # student_lesson.student = Student.find_by(last_name: "RIVELINE", first_name: "arié")
  # student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson13
  student_lesson.student = Student.find_by(last_name: "METGE", first_name: "raphael")
  student_lesson.save


  lesson14 = Lesson.new(court: 2, start_time: "1996-01-02 18:00", end_time:"1996-01-02 19:00")
  lesson14.teacher = teacher2
  lesson14.save!

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson14
  student_lesson.student = Student.find_by(last_name: "BESSET", first_name: "guillaume")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson14
  student_lesson.student = Student.find_by(last_name: "ROSSI", first_name: "louis")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson14
  student_lesson.student = Student.find_by(last_name: "LESAGE", first_name: "jean")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson14
  student_lesson.student = Student.find_by(last_name: "DUQUESNE", first_name: "romain")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson14
  student_lesson.student = Student.find_by(last_name: "SAKHRANI", first_name: "anish")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson14
  student_lesson.student = Student.find_by(last_name: "SAKHRANI", first_name: "akash")
  student_lesson.save

  lesson15 = Lesson.new(court: 2, start_time: "1996-01-02 19:00", end_time:"1996-01-02 19:00")
  lesson15.teacher = teacher2
  lesson15.save!

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson15
  student_lesson.student = Student.find_by(last_name: "RICOUR", first_name: "antoine")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson15
  student_lesson.student = Student.find_by(last_name: "RICOUR", first_name: "olivia")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson15
  student_lesson.student = Student.find_by(last_name: "ROMMER", first_name: "paul")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson15
  student_lesson.student = Student.find_by(last_name: "SABBAH", first_name: "tristan")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson15
  student_lesson.student = Student.find_by(last_name: "FEUILLETTE", first_name: "coline")
  student_lesson.save


  lesson16 = Lesson.new(court: 2, start_time: "1996-01-02 20:00", end_time:"1996-01-02 19:00")
  lesson16.teacher = teacher2
  lesson16.save!

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson16
  student_lesson.student = Student.find_by(last_name: "AUVRELE", first_name: "charlotte")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson16
  student_lesson.student = Student.find_by(last_name: "THOLLARD", first_name: "pascale")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson16
  student_lesson.student = Student.find_by(last_name: "DECOEUR", first_name: "marie")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson16
  student_lesson.student = Student.find_by(last_name: "FERNET", first_name: "charlotte")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson16
  student_lesson.student = Student.find_by(last_name: "PRAUD", first_name: "amandine")
  student_lesson.save

  lesson17 = Lesson.new(court: 2, start_time: "1996-01-02 21:00", end_time:"1996-01-02 19:00")
  lesson17.teacher = teacher2
  lesson17.save!

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson17
  student_lesson.student = Student.find_by(last_name: "LAHYANI", first_name: "isabelle")
  student_lesson.save

  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson17
  student_lesson.student = Student.find_by(last_name: "SAMARCQ", first_name: "julien")
  student_lesson.save


  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson17
  student_lesson.student = Student.find_by(last_name: "AOUIZERATE", first_name: "ruben")
  student_lesson.save


  student_lesson = StudentLesson.new
  student_lesson.lesson = lesson17
  student_lesson.student = Student.find_by(last_name: "COQUOZ", first_name: "francesco")
  student_lesson.save

  # student not parsed
  # student_lesson = StudentLesson.new
  # student_lesson.lesson = lesson17
  # student_lesson.student = Student.find_by(last_name: "VAUDELEAU", first_name: "florian")
  # student_lesson.save


puts "----------"
puts ">>>> Done!"
puts "#{Lesson.count} lessons created"
puts ""
