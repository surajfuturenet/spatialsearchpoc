# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

Conservation.destroy_all

counter = 0

CSV.foreach("db/conservations.csv",headers:true).with_index do |line, i|
	 Conservation.create! line.to_hash.except(*%w{type address})

	 GC.start if i % 100 == 0 # forcing garbage collection
end
