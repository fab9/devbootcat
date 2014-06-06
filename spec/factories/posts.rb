
factory :post do |f|
	f.author_id { Faker::Number.number(1) }
	f.title { Faker::Lorem.words(5) }
	f.body { Faker::Lorem.sentence(5)}
end