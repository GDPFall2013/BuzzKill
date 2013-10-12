/**
 * Listens for the app launching then creates the window
 *
 * @see http://developer.chrome.com/trunk/apps/app.runtime.html
 * @see http://developer.chrome.com/trunk/apps/app.window.html
 */
chrome.app.runtime.onLaunched.addListener(function() {
  // Center window on screen.
  var screenWidth = screen.availWidth;
  var screenHeight = screen.availHeight;
  var width = 640;
  var height = 480;

  chrome.app.window.create('index.html', {
    bounds: {
      width: width,
      height: height,
      left: Math.round((screenWidth-width)/2),
      top: Math.round((screenHeight-height)/2)
    }, 
    frame: 'none'//,  // Change this to 'chrome' if you want buttons on the top (minimize, maximize, X)
  	//state: 'fullscreen'
  });
});