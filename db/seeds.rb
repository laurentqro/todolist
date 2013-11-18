# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Task.destroy_all
tasks = ["buy milk", "check flights", "send postcards to mum", "book table for two at fish place"]
tasks.each do |task|
  Task.create description: task
end
