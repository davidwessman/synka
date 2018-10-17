import shiftStatus from 'application/shift_status';
import menuDisplay from 'application/menu';

document.addEventListener('turbolinks:load', () => {
  shiftStatus.initialize();
  menuDisplay.initialize();
});

document.addEventListener('turbolinks:before-cache', () => {
  shiftStatus.tearDown();
  menuDisplay.tearDown();
});
