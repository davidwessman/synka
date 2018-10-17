const menuDisplay = {
  hideContent() {
    const content = document.getElementById('menu-content');
    content.classList.replace('block', 'hidden');
  },
  showContent() {
    const content = document.getElementById('menu-content');
    content.classList.replace('hidden', 'block');
  },
  clickMenu(event) {
    event.preventDefault();
    const button = event.currentTarget;
    if (button.dataset.state == 'closed') {
      menuDisplay.showContent();
      button.dataset.state = 'open';
      button.classList.remove('button-teal-inverse');
      button.classList.add('button-teal');
    } else {
      menuDisplay.hideContent();
      button.dataset.state = 'closed';
      button.classList.remove('button-teal');
      button.classList.add('button-teal-inverse');
    }
  },
  initialize() {
    const button = document.getElementById('menu-button');
    button.addEventListener('click', this.clickMenu, true);
    button.dataset.state = 'closed';
    this.hideContent();
  },
  tearDown() {
    const button = document.getElementById('menu-button');
    button.removeEventListener('click', this.clickMenu, true);
    button.dataset.state = 'open';
    this.showContent();
  }
};

export default menuDisplay;
