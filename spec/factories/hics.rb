FactoryBot.define do
  factory :hic do
    hic              {'古池や蛙飛び込む水の音'}
    kigo             {'蛙'}
    user_id          {1}
    pict_id          {2}

    association :user
    association :pict



  end
end