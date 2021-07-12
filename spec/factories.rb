FactoryBot.define do
    factory :user do
        name   { 'Jean' }
        email        { 'toto@gmail.com' }
        password     { 'azerty' }
    end
end