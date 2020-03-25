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

  student = Student.create(last_name: last_name, first_name: first_name, mobile_phone: mobile_phone, birth_date: birth_date, email: email)
  student.save
end

puts ">>>> Done!"
puts "#{Student.count} students created"
