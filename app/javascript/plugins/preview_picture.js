const initPictureInput = () => {
  const input = document.querySelector('#ongoing_task_photo_after');

  if(input) {
    input.addEventListener('input', (event) => {
      const url = URL.createObjectURL(event.target.files[0]);
      document.querySelector(".preview_img").src = url;
      document.querySelector(".preview_img").classList.add('photo-preview');
    });
  }
}

export { initPictureInput };