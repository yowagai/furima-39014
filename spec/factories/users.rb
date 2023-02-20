FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
   end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 4) + '1' + 'a'}
    password_confirmation {password}
    family_name           {person.last.kanji }
    first_name            {person.first.kanji}
    family_name_kana      {person.last.katakana}
    first_name_kana       {person.first.katakana}
    birthday              {'1991/1/1'}
  end
end