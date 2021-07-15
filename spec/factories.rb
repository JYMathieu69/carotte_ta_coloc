FactoryBot.define do
    factory :user, aliases: [:leader, :carotted_user] do
        username { 'Toto' }
        email    { 'toto@gmail.com' }
        password { 'azerty' }
    end

    factory :task do
        name               { 'Vaisselle' }
        description        { 'Faire la vaisselle, c\'est cool' }
        recurrence         { 'daily' }
        auto_assigned      { false } 
        default_difficulty { 1 }
    end

    factory :coloc do
        leader
        name         { 'ALaCool' }
        invite_token { '25689' }
    end

    factory :coloc_task do
        coloc
        task
        difficulty { 2 }
        points     { difficulty * 15 }
    end

    factory :ongoing_task do
        coloc_task
        done          { false }
        points_ratio  { 1 }
        final_points  { coloc_task.points * points_ratio }
    end
end
