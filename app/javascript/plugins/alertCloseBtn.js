const initAlertCloseBtn = () => {
  const buttonElement = document.querySelector('button[data-dismiss="alert"]');
  if (buttonElement) {
    buttonElement.addEventListener('click', () => {
      buttonElement.parentNode.remove();
    });
  }
}

export { initAlertCloseBtn };
