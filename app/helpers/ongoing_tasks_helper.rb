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
      'flex carrot-circle-big align-center finished'
    else
      'flex carrot-circle-big align-center'
    end
  end
end
