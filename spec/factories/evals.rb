FactoryBot.define do
  factory :eval do
    review              {'清々しい俳句ですね！'}
    scene               {3}
    kigo                {3}
    rhythm              {3}
    tech                {3}
    original            {3}

    association :user
    association :pict
    association :hic

  end
end