class DistributionTaskService

    def initialize(attributes = {})
        @coloc = attributes[:coloc]
        @coloc_tasks_by_difficulty = @coloc.coloc_tasks.order(points: :desc).group_by { |coloc_task| coloc_task.points }.values
    end
    
    def distribution

        @coloc_tasks_by_difficulty.each { |sub_array| sub_array.shuffle! }
        
        coloc_tasks_to_assign = @coloc_tasks_by_difficulty.flatten
        
        coloc_tasks_to_assign.each do |task|

            weekly_points_by_users = {}

            @coloc.users.each do |user|
                weekly_points_by_users[user.username] = user.ongoing_tasks.sum(:final_points)
            end

            users_with_min_points = weekly_points_by_users.filter do |user, weekly_points| 
                weekly_points == weekly_points_by_users.values.min 
            end

            user_with_less_points = User.find_by(username: users_with_min_points.keys.sample)
            
            OngoingTask.create!(user_id: user_with_less_points.id, coloc_task_id: task.id)

        end
    end
end
