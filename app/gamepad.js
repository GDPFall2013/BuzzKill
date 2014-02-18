var controllers = {};
var rAF =  window.requestAnimationFrame;

function scangamepads() {
  var gamepads = navigator.webkitGetGamepads();
  for (var i = 0; i < gamepads.length; i++) {
    if (gamepads[i]) {
		controllers[gamepads[i].index] = gamepads[i]; 
    }
  }
  rAF(scangamepads);
}

if (navigator.webkitGetGamepads) {
  rAF(scangamepads);
}