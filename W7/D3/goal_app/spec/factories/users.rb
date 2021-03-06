FactoryBot.define do

    # Faker is a gem that generates random fake data!
    # Faker has different categories (Movies, Internet, Quotes, etc.)
  
    factory :user do
      username { Faker::Movies::HarryPotter.character } # assigns user to the result of the block
      password { "password" }
    end
  
    # factory :goal do
    #     title { "Workout" }
    #     body { "Lower body tomorrow" }
    #     user_id { 1 }
    # end
  end