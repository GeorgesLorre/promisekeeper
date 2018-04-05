import Typed from 'typed.js';

function loadText(){

  new Typed ('.title-input', {
    strings: ["I PROMISE TO ...", "I PROMISE TO CLEAN MY ROOM", "I PROMISE TO STOP STARING", "I PROMISE TO PLAY THE VIOLIN", "I PROMISE TO COMMIT MORE", "YOUR TURN"],
    typeSpeed: 30,
    bindInputFocusEvents: true,
    attr: 'placeholder',
    smartBackspace: true,
    loop: true,
  });

}


export { loadText };
