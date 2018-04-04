import Typed from 'typed.js';

function loadText(){
  new Typed ('.title-input', {
    strings: ["I promise to", "Clean my room", "Stop staring", "Play the violin", "Commit more", "Your turn"],
    typeSpeed: 30,
    bindInputFocusEvents: true,
    attr: 'placeholder',
    loop: false,
  });
}


export { loadText };
