import Typed from 'typed.js';

function loadText(){
  new Typed ('.title-input', {
    strings: ["Make a promise", "Clean my room", "Stop staring", "Play the violin", "Commit more often", "Your turn"],
    typeSpeed: 30,
    bindInputFocusEvents: true,
    attr: 'placeholder',
    loop: false,
  });
}


export { loadText };
