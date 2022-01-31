// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
// import { displayTabs } from '../plugins/display_tabs.js';
import { initPictureInput } from "../plugins/preview_picture.js";
import {
  initClickableTasks,
  initCloseTaskClickOutside,
  initCloseTaskModal,
} from "../plugins/modals";
import { coloredSwitchButtons } from "../plugins/toggle_switch_button.js";
import {initOnboarding} from "../channels/onboarding_channel"
Rails.start();
Turbolinks.start();
ActiveStorage.start();

import "stylesheets/application";

document.addEventListener("turbolinks:load", () => {
  // const allTabs = document.querySelectorAll('.tablinks')
  // if (allTabs) {
  //     allTabs.forEach((tab) => {
  //         tab.addEventListener('click', ((event) => {
  //             displayTabs(event, tab.dataset.tabname)
  //         }))
  //     })
  // }
  initClickableTasks();
  initCloseTaskClickOutside();
  initCloseTaskModal();
  initPictureInput();
  coloredSwitchButtons();
  initOnboarding();
});
