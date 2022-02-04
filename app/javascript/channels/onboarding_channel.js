import consumer from "./consumer"
import {URLConfig} from "@cloudinary/url-gen";
import {CloudConfig} from "@cloudinary/url-gen";
import {CloudinaryImage} from '@cloudinary/url-gen';

const cloudConfig = new CloudConfig({cloudName: process.env.CLOUDINARY_NAME});
const urlConfig = new URLConfig({secure: true});

const initOnboarding = () => {
  const pendingUsersElement = document.getElementById('pending-users');
  
  if (pendingUsersElement) {
    consumer.subscriptions.create({channel: "OnboardingChannel", coloc: pendingUsersElement.dataset.coloc}, {
      connected() {
        // Called when the subscription is ready for use on the server
      },
  
      disconnected() {
        // Called when the subscription has been terminated by the server
      },
  
      received(data) {
        // Called when there's incoming data on the websocket for this channel
        const userAvatar = new CloudinaryImage(data.avatar_key, cloudConfig, urlConfig);
        pendingUsersElement.innerHTML += `
          <div class='flex flex-col justify-center items-center'>
            <img src=${userAvatar.toURL()} class="rounded-full h-16 w-16" />
            <p class="mt-4 text-sm">${data.user.username}</p>
          </div>
          `;  
      }
    });
  }
}

export { initOnboarding };