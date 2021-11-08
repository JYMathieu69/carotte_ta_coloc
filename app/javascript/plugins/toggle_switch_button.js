const coloredSwitchButtons = () => {
    const switchButtons = document.querySelectorAll("input[type=checkbox]")
    
    if (switchButtons) {
        switchButtons.forEach((switchButton) => {
            switchButton.addEventListener("input", () => { switchButton.closest(".addable-switch-task").classList.toggle("grayscale") })
        })
    }
}

export { coloredSwitchButtons };
