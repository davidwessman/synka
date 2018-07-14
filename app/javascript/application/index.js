import shiftStatus from 'application/shift_status';
import loadConnections from 'application/load_connections';

document.addEventListener('turbolinks:load', () => {
  shiftStatus.initialize();
  loadConnections.initialize();
});

document.addEventListener('turbolinks:before-cache', () => {
  shiftStatus.tearDown();
});
