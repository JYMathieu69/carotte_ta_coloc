module OngoingTasksHelper
  def finished_task_img_class?(task)
    if task.finished?
      'finished task-content'
    else
      'task-content'
    end
  end

  def finished_carrot_img_class?(task)
    if task.finished?
      'finished mt-4'
    else
      'mt-4' 
    end
  end
end
