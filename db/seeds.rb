# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Task.destroy_all

tasks = ["buy milk", "check flights", "send postcards to mum", "book table for two at fish place", "ring auntie Josie", "Go to the swimming pool", "Buy chocolate"]
colors = %w[MistyRose Plum Thistle Lavender LavenderBlush LemonChiffon LightBlue LightGreen LightSteelBlue PaleVioletRed PeachPuff]
status = %w[open closed]

tasks.each do |task|
  Task.create description: task, color: colors.sample, status: status.sample
end

puts "There are now #{tasks.count} in your database."
