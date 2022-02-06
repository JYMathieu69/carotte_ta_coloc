const initUpdatableAvatar = () => {
  const inputElement = document.getElementById('user_avatar');

  if (inputElement) {
    const formElement = document.getElementById('edit_user_info');
    inputElement.addEventListener('change', () => {
      formElement.submit();
    })  
  }
}

export { initUpdatableAvatar };