const initClickableTasks = () => {
  const ongoing_tasks = document.querySelectorAll('.task-content');
  if (ongoing_tasks) {
    ongoing_tasks.forEach((task) => {
      task.addEventListener('click', () => {
        document.getElementById("task" + task.dataset.taskId).classList.add("open");
      });
    });
  };
};

const initCloseTaskModal = () => {
  const closeTaskModalButtons = document.querySelectorAll('.close');
  if (closeTaskModalButtons) {
    closeTaskModalButtons.forEach((task) => {
      task.addEventListener('click', () => {
          document.getElementById("task" + task.dataset.taskId).classList.remove("open");
      })
    });
  }
}

const initCloseTaskClickOutside = () => {
  document.addEventListener('click', (event) => {
    const openedModal = document.querySelector(".open")
    const modalContent = document.querySelector(".open .modal-content")
    if (openedModal && !event.target.classList.contains("task-content") && !event.path.includes(modalContent)) {
        openedModal.classList.remove("open");
    }
  });
}

export { initClickableTasks, initCloseTaskModal, initCloseTaskClickOutside }