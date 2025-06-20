// main.js
import { createApp } from 'vue';
import { createPinia } from 'pinia';
import { markRaw } from 'vue';
import toastr from 'toastr';
import 'bootstrap/dist/js/bootstrap.js';
import 'bootstrap-icons/font/bootstrap-icons.min.css';
import 'bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css';
import 'bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js';
import './assets/main.css';
import 'toastr/build/toastr.min.css';

import App from './App.vue';
import router from './router';

// Configure toastr options
toastr.options = {
  closeButton: true,
  progressBar: true,
  timeOut: 3000, // Duration before fading out (in milliseconds)
  extendedTimeOut: 1000,
  positionClass: 'toast-top-right',
  fadeOut: 250, // Adjusted for faster fade-out
};

// Create Vue app and Pinia instance
const app = createApp(App);
const pinia = createPinia();

// Add router to Pinia stores (if needed)
pinia.use(({ store }) => {
  store.router = markRaw(router);
});

// Apply plugins and global properties
app.use(pinia);
app.config.globalProperties.$toastr = toastr;
app.use(router);

  app.mount('#app');