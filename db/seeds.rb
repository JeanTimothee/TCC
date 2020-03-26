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

xlsx = Roo::Spreadsheet.open('./data/fichier_eleves.xlsx')
xlsx = Roo::Excelx.new('./data/fichier_eleves.xlsx')

puts "Creating Students..."
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

puts ">>>> Done!"
puts "#{Student.count} students created"
