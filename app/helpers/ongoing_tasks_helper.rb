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
      'carrot_price_circle finished'
    else
      'carrot_price_circle'
    end
  end
end
