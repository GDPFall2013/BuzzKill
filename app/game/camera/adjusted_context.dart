part of camera;


class AdjustedContext {
  CanvasRenderingContext2D context;
  
  String get fillStyle => context.fillStyle;
  void set fillStyle(String newFillStyle) {
    context.fillStyle = newFillStyle;
  }
  String get font => context.font;
  void set font(String newFont) {
    context.font = newFont;
  }
  String get strokeStyle => context.strokeStyle;
  void set strokeStyle(String newStrokeStyle) {
    context.strokeStyle = newStrokeStyle;
  }

  
  AdjustedContext() {
    
  }
  
  void rect(num x, num y, num width, num height) {
    context.rect(x, y, width, height);
  }
  
  void clearRect(num x, num y, num width, num height) {
    context.clearRect(x, y, width, height);
  }
  
  void fillRect(num x, num y, num width, num height) {
    context.fillRect(x, y, width, height);
  }
  
  void fillText(String text, num x, num y, [num maxWidth]){
    context.fillText(text, x, y);//, [numMaxWidth]); //TODO fix this
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
    context.lineTo(x, y);
  }
  
  void moveTo(num x, num y) {
    context.moveTo(x, y);
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
    context.drawImageScaled(source, destX, destY, destWidth, destHeight);
  }
  
  void drawImageScaledFromSource(CanvasImageSource source, num sourceX, num sourceY, num sourceWidth, num sourceHeight, num destX, num destY, num destWidth, num destHeight){
    context.drawImageScaledFromSource(source, sourceX, sourceY, sourceWidth, sourceHeight, destX, destY, destWidth, destHeight);
  }
  
}