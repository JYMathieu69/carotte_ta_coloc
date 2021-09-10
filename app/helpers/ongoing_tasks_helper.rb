module OngoingTasksHelper
  def finished_task_img_class?(task)
    if task.finished?
      'finished'
    else
      'task-content'
    end
  end

  def finished_carrot_img_class?(task)
    if task.finished?
      'd-flex carrot-circle-big align-center finished'
    else
      'd-flex carrot-circle-big align-center'
    end
  end
end
