var controllers = {};
var rAF = window.mozRequestAnimationFrame ||
  window.webkitRequestAnimationFrame ||
  window.requestAnimationFrame;

function connecthandler(e) {
  addgamepad(e.gamepad);
}
function addgamepad(gamepad) {
  controllers[gamepad.index] = gamepad; var d = document.createElement("div");
  d.setAttribute("id", "controller" + gamepad.index);
  var t = document.createElement("h1");
  t.appendChild(document.createTextNode("gamepad: " + gamepad.id));
  d.appendChild(t);
  var b = document.createElement("div");
  b.className = "buttons";
  for (var i=0; i<gamepad.buttons.length; i++) {
    var e = document.createElement("span");
    e.className = "button";
    //e.id = "b" + i;
    e.innerHTML = i;
    b.appendChild(e);
  }
  d.appendChild(b);
 // var a = document.createElement("div");
 // a.className = "axes";
 // for (var i=0; i<gamepad.axes.length; i++) {
 //   var e = document.createElement("progress");
 //   e.className = "axis";
 //   //e.id = "a" + i;
 //   e.setAttribute("max", "2");
 //   e.setAttribute("value", "1");
  //  e.innerHTML = i;
  //  a.appendChild(e);
  //}
 // d.appendChild(a);
  //document.getElementById("start").style.display = "none";
  document.body.appendChild(d);
  rAF(updateStatus);
}

function disconnecthandler(e) {
  removegamepad(e.gamepad);
}

function removegamepad(gamepad) {
  var d = document.getElementById("controller" + gamepad.index);
  document.body.removeChild(d);
  delete controllers[gamepad.index];
}

function updateStatus() {
  if (navigator.webkitGetGamepads) {
    scangamepads();
  }
  for (j in controllers) {
    var controller = controllers[j];
    var d = document.getElementById("controller" + j);
    var buttons = d.getElementsByClassName("button");
    for (var i=0; i<controller.buttons.length; i++) {
      var b = buttons[i];
      var val = controller.buttons[i];
      var pressed = val == 1.0;
      if (typeof(val) == "object") {
        pressed = val.pressed;
        val = val.value;
      }
      var pct = Math.round(val * 100) + "%"
      b.style.backgroundSize = pct + " " + pct;
      if (pressed) {
        b.className = "button pressed";
      } else {
        b.className = "button";
      }
    }

   // var axes = d.getElementsByClassName("axis");
  //  for (var i=0; i<controller.axes.length; i++) {
   //   var a = axes[i];
  //    a.innerHTML = i + ": " + controller.axes[i].toFixed(4);
  //    a.setAttribute("value", controller.axes[i] + 1);
  //  }
  }
  rAF(updateStatus);
}

function scangamepads() {
  var gamepads = navigator.webkitGetGamepads();
  for (var i = 0; i < gamepads.length; i++) {
    if (gamepads[i]) {
      if (!(gamepads[i].index in controllers)) {
        addgamepad(gamepads[i]);
      } else {
        controllers[gamepads[i].index] = gamepads[i];
      }
    }
  }
}

window.addEventListener("gamepadconnected", connecthandler);
window.addEventListener("gamepaddisconnected", disconnecthandler);
if (navigator.webkitGetGamepads) {
  setInterval(scangamepads, 500);
}