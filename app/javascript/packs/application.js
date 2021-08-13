// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import { displayTabs } from '../plugins/display_tabs.js';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', () => {
    const allTabs = document.querySelectorAll('.tablinks')
    if (allTabs) {
        allTabs.forEach((tab) => {
            tab.addEventListener('click', ((event) => {
                displayTabs(event, tab.dataset.tabname)
            }))
        })
    }
    document.querySelectorAll('.task-content').forEach((task) => {
        task.addEventListener('click', function () {
            document.getElementById("task" + task.dataset.taskId).classList.add("open");
        })
    });
    document.querySelectorAll('.close').forEach((task) => {
        task.addEventListener('click', function () {
            document.getElementById("task" + task.dataset.taskId).classList.remove("open");
        })
    });
    document.addEventListener('click', (event) => {
        const openedModal = document.querySelector(".open")
        const modalContent = document.querySelector(".open .modal-content")
        if (openedModal && !event.target.classList.contains("task-content") && !event.path.includes(modalContent)) {
            openedModal.classList.remove("open");
        }
    });
});
