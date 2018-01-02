# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

prng = Random.new

200.times do 
    n = prng.rand(20) 
    quest = Question.create(title: Faker::Lorem.sentence , content: Faker::Lorem.paragraph(3),views:prng.rand(10))
    n.times do
        quest.answers.build(content: Faker::Lorem.paragraph(2))
    end
    quest.save
end
