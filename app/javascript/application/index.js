import shiftStatus from 'application/shift_status';

document.addEventListener('turbolinks:load', () => {
  shiftStatus.initialize();
});

document.addEventListener('turbolinks:before-cache', () => {
  shiftStatus.tearDown();
});
