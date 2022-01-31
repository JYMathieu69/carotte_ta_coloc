const initClickableTasks = () => {
  const ongoing_tasks = document.querySelectorAll('.task-card');
  if (ongoing_tasks) {
    ongoing_tasks.forEach((task) => {
      task.addEventListener('click', (e) => {
        if (e.target.classList.contains("close")) return;
        if (e.path.some(e => e.classList && e.classList.contains("open"))) return;
        const currentOpenTabs = document.querySelector(".open");
        if (currentOpenTabs) {
          currentOpenTabs.classList.remove('open');
        }
        const taskModal = document.getElementById("task" + task.dataset.taskId);
        taskModal.classList.add("open");
        console.log('open')
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
    const isCard = event.path.some(e => e.classList && e.classList.contains("task-card")) && event.path.every(e => !e.classList || !e.classList.contains("open"))
    if (openedModal && !event.path.includes(modalContent) && !isCard) {
      openedModal.classList.remove("open");
    }
  });
}

export { initClickableTasks, initCloseTaskModal, initCloseTaskClickOutside }