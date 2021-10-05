const initPictureInput = () => {
const input = document.querySelector('#user_task_photo')

if(input) {
    input.addEventListener('input', (event) => {
const url = URL.createObjectURL(event.target.files[0])
console.log(url)
document.querySelector(".preview_img").src = url
document.querySelector(".preview_img").classList.add('bigger_img')
document.querySelector(".container-photo").classList.add('adapt_heigh')
});
}
}

export { initPictureInput };