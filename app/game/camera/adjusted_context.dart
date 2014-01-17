part of camera;


class AdjustedContext {
  CanvasRenderingContext2D context;

  double yAdjust;
  double xAdjust;
  String get fillStyle => context.fillStyle;
  void set fillStyle(var newFillStyle) {
    context.fillStyle = newFillStyle;  //TODO this is not working with block
  }

  
  String get font => context.font;
  void set font(String newFont) {
    context.font = newFont;
  }
  String get strokeStyle => context.strokeStyle;
  void set strokeStyle(String newStrokeStyle) {
    context.strokeStyle = newStrokeStyle;
  }

  
  AdjustedContext(int viewportWidth, int viewportHeight) {
    //TODO get these from the right spot
    yAdjust = viewportHeight * (1 - .5);//Camera.instance.screenRatio);
    xAdjust = viewportWidth * (1 - .75);
  }
  
  void rect(num x, num y, num width, num height) {
    context.rect(
        x * Camera.instance.screenRatio + xAdjust, 
        y * Camera.instance.screenRatio + yAdjust, 
        width * Camera.instance.screenRatio, 
        height * Camera.instance.screenRatio);
  }
  
  void clearRect(num x, num y, num width, num height) {
    context.clearRect(
        x * Camera.instance.screenRatio + xAdjust, 
        y * Camera.instance.screenRatio + yAdjust, 
        width * Camera.instance.screenRatio, 
        height * Camera.instance.screenRatio);
  }
  
  void fillRect(num x, num y, num width, num height) {
    context.fillRect(
        x * Camera.instance.screenRatio + xAdjust, 
        y * Camera.instance.screenRatio + yAdjust, 
        width * Camera.instance.screenRatio, 
        height * Camera.instance.screenRatio);
  }
  
  void fillText(String text, num x, num y, [num maxWidth]){
    context.fillText(text, 
        x * Camera.instance.screenRatio + xAdjust, 
        y * Camera.instance.screenRatio  + yAdjust);//, [numMaxWidth]); //TODO fix this
  }
  
  void save() {
    context.save();
  }
  
  void restore() {
    context.restore();
  }
  
  void fill() {
    context.fill();
  }
  
  void beginPath() {
    context.beginPath();
  }
  
  void lineTo(num x, num y) {
    context.lineTo(
        x * Camera.instance.screenRatio + xAdjust, 
        y * Camera.instance.screenRatio + yAdjust);
  }
  
  void moveTo(num x, num y) {
    context.moveTo(
        x * Camera.instance.screenRatio + xAdjust, 
        y * Camera.instance.screenRatio  + yAdjust);
  }
  
  void stroke() {
    context.stroke();
  }
  
  CanvasPattern createPattern(CanvasElement canvas, String repetitionType) {
    context.createPattern(canvas, repetitionType);
  }
  
  CanvasPattern createPatternFromImage(ImageElement image, String repetitionType) {
    context.createPatternFromImage(image, repetitionType);
  }
  
 // void drawImageScaled(CanvasImageSource source, num destX, num destY, num destWidth, num destHeight){
 //   context.drawImageScaled(source, destX, destY, destWidth, destHeight);
 // }
  
  void drawImageScaledFromSource(CanvasImageSource source, num sourceX, num sourceY, num sourceWidth, num sourceHeight, num destX, num destY, num destWidth, num destHeight){
    context.drawImageScaledFromSource(source, sourceX, sourceY, sourceWidth, sourceHeight, 
        destX * Camera.instance.screenRatio + xAdjust, 
        destY * Camera.instance.screenRatio  + yAdjust, 
        destWidth * Camera.instance.screenRatio, 
        destHeight* Camera.instance.screenRatio);
  }
  
}