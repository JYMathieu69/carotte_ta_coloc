const initClickableTasks = () => {
  const ongoing_tasks = document.querySelectorAll('.task-card');
  ongoing_tasks.forEach((task) => {
    task.addEventListener('click', () => {
      document.getElementById("task" + task.dataset.taskId)
        .classList.add('open');
    });
  });
};

const clickCrossToClose = () => {
  const allCrosses = document.querySelectorAll('.closeButton');
  allCrosses.forEach((crossButton) => {
    crossButton.addEventListener('click', () => {
      document.getElementById("task" + crossButton.dataset.taskId)
        .classList.remove('open');
    });
  });
}

export { initClickableTasks, clickCrossToClose }