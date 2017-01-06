Fabricator(:item) do
  name {Faker::Cat.breed}
  description {Faker::Hacker.say_something_smart}
  image_url {Faker::Placeholdit.image}
end