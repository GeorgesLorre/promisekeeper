import Typed from 'typed.js';

function loadText(){
  new Typed ('#banner-typed-text', {
    strings: ["Hi John!", "How are you doing?", "Wife and kids alright?", "She did what?", "Women are a labyrinth my friend...", "I gotta go"],
    typeSpeed: 50,
    loop: true
  });
}


export { loadText };
