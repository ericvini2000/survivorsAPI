50.times  do
	Survivor.create({
		name: Faker::Name.name,
		age: Faker::Number.within(range:0..100),
		gender: Faker::Number.within(range:0..1),
		lat: Faker::Number.positive,
		long: Faker::Number.positive,
		abducted: Faker::Boolean.boolean(true_ratio: 0.2),
		abduction_reports: Faker::Number.within(range:0..3)
	})
end