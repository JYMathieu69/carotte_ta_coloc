FactoryBot.define do
    factory :user do
        first_name   { 'Jean' }
        last_name    { 'Toto' }
        email        { 'toto@gmail.com' }
        phone_number { '0695500784' }
        is_entrepreneur { true }
        password     { 'azerty' }
    end
end