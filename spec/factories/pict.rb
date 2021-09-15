FactoryBot.define do
  factory :pict do


    
    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
    
  end
end