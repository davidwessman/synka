import menuDisplay from 'application/menu';

document.addEventListener('turbolinks:load', () => {
  menuDisplay.initialize();
});

document.addEventListener('turbolinks:before-cache', () => {
  menuDisplay.tearDown();
});
