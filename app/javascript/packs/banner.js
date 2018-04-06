import Typed from 'typed.js';

function loadText(){
  if (document.getElementsByClassName('title-input').length > 0 ){
  new Typed ('.title-input', {
    strings: ["I promise to ...", "I promise to clean my room", "I promise to stop staring", "I promise to play the violin", "I promise to commit more", "your turn"],
    typeSpeed: 50,
    bindInputFocusEvents: true,
    attr: 'placeholder',
    smartBackspace: true,
    loop: true,

  });
  }
}


export { loadText };
