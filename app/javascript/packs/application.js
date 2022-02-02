import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import { initPictureInput } from "../plugins/preview_picture.js";
import {
  initClickableTasks,
  clickCrossToClose,
} from "../plugins/modals";
import { coloredSwitchButtons } from "../plugins/toggle_switch_button.js";
import { initAlertCloseBtn } from "../plugins/alertCloseBtn";

import { initOnboarding } from "../channels/onboarding_channel";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

import "stylesheets/application";

document.addEventListener("turbolinks:load", () => {
  initClickableTasks();
  clickCrossToClose();
  initPictureInput();
  coloredSwitchButtons();
  initOnboarding();
  initAlertCloseBtn();
});
