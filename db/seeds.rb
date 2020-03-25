# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'nokogiri'

file      = File.open('../data/fichier_ttc.xml')
document  = Nokogiri::XML(file)

document.root.xpath('fichier_ttc').first do |student|
  last_name = student.xpath('NOM').text
  first_name = student.xpath('PRENOM').text
  mobile_phone = student.xpath('TEL PORT').text
  fixed_phone = student.xpath('TEL DOM').text
  birth_date = student.xpath('DATE DE NAISS').text
  email = student.xpath('E.MAIL').text

  puts "#{last_name} #{first_name}, tel:#{mobile_phone}#{"and #{fixed_phone}" unless fixed_phone.nil? } né le #{birth_date}"
end
