part of camera;

/*
 * This class is designed to be used instead of a 
 * CanvasRenderingContext2D object for when you want the 
 * operations to be affected by the camera
 */
class AdjustedContext {
  CanvasRenderingContext2D context;

  double yAdjust;
  double xAdjust;
  String get fillStyle => throw new UnimplementedError();
  void set fillStyle(var newFillStyle) {
    throw new UnimplementedError("Use the normal context");
  }
  
  String get font => throw new UnimplementedError("Use the normal context");
  void set font(String newFont) {
    throw new UnimplementedError("Use the normal context");
  }
  String get strokeStyle => throw new UnimplementedError("Use the normal context");
  void set strokeStyle(String newStrokeStyle) {
    throw new UnimplementedError("Use the normal context");
  }

  
  AdjustedContext(int viewportWidth, int viewportHeight, double screenRatio) {
    yAdjust = viewportHeight * (1 - screenRatio);
    xAdjust = viewportWidth * (1 - screenRatio * 1.8);// Is 1.8 a magic number?
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
  
  void drawImageScaled(CanvasImageSource source, num destX, num destY, num destWidth, num destHeight){
   throw new UnimplementedError();
  }
  
  void drawImageScaledFromSource(CanvasImageSource source, num sourceX, num sourceY, num sourceWidth, num sourceHeight, num destX, num destY, num destWidth, num destHeight){
    context.drawImageScaledFromSource(source, sourceX, sourceY, sourceWidth, sourceHeight, 
        destX * Camera.instance.screenRatio + xAdjust, 
        destY * Camera.instance.screenRatio  + yAdjust, 
        destWidth * Camera.instance.screenRatio, 
        destHeight* Camera.instance.screenRatio);
  }
  
}