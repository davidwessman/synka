const shiftStatus = {
  listener(event) {
    const parent = event.target.parentNode;
    let button = parent.querySelector('button[type=submit]');
    button.classList.remove('button-grey');
    button.classList.add('button-blue');
  },

  initialize() {
    const shiftForms = document.getElementsByClassName('update-shift');
    Array.from(shiftForms).forEach((node) => {
      const inputs = node.querySelectorAll('input[type=time]');
      Array.from(inputs).forEach((input) => {
        input.addEventListener('input', this.listener);
      });
    });
  },

  tearDown() {
    const shiftForms = document.getElementsByClassName('update-shift');
    Array.from(shiftForms).forEach((node) => {
      const inputs = node.querySelectorAll('input[type=time]');
      Array.from(inputs).forEach((input) => {
        input.removeEventListener('input', this.listener);
      });
    });
  }
};

export default shiftStatus;
