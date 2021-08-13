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
    document.querySelectorAll('.unassigned-task-content').forEach((task, index) => {
        task.addEventListener('click', function () {
            document.getElementById("unassigned-task" + index).style.display = 'flex';
        })
    });
    document.querySelectorAll('.close-unassigned-task').forEach((task, index) => {
        task.addEventListener('click', function () {
            document.getElementById("unassigned-task" + index).style.display = 'none';
        })
    });
    document.querySelectorAll('.user-task-content').forEach((task, index) => {
        task.addEventListener('click', function () {
            document.getElementById("user-task" + index).style.display = 'flex';
        })
    });
    document.querySelectorAll('.close-user-task').forEach((task, index) => {
        task.addEventListener('click', function () {
            document.getElementById("user-task" + index).style.display = 'none';
        })
    });
});
