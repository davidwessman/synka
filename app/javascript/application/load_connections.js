const loadConnections = {
  initialize() {
    const connections = document.querySelectorAll('[data-loaded=false]');

    Array.from(connections).forEach((connection) => {
      const button = connection.getElementsByClassName('load')[0];
      button.click();
    });
  },
};

export default loadConnections;
