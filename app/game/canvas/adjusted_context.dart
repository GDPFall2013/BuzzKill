part of canvas;

  /*
   * This class is designed to be used instead of a 
   * CanvasRenderingContext2D object for when you want the 
   * operations to be affected by the camera
   */
  class AdjustedContext {
    CanvasRenderingContext2D context;

    double yAdjust;
    double xAdjust;
    
//  String get backingStorePixelRatio => throw new UnimplementedError();
//  void set backingStorePixelRatio(var ratio) {
//    throw new UnimplementedError("Use the normal context");
//  }
//  
//  get canvas =>  throw new UnimplementedError();
//  void set canvas(var canvas) {
//    throw new UnimplementedError("Use the normal context");
//  }
//  
//  Path get currentPath =>  throw new UnimplementedError();
//  void set currentPath(var path) {
//    throw new UnimplementedError("Use the normal context");
//  }
//  
//  get fillStyle => throw new UnimplementedError();
    void set fillStyle(var newFillStyle) {
      context.fillStyle = newFillStyle;
    }
//  
//  String get font => throw new UnimplementedError("Use the normal context");
//  void set font(String newFont) {
//    throw new UnimplementedError("Use the normal context");
//  }
//  
//  num get globalAlpha => throw new UnimplementedError("Use the normal context");
//  void set globalAlpha(num newAlpha) {
//    throw new UnimplementedError("Use the normal context");
//  }
//  
//  String get globalCompositeOperation => throw new UnimplementedError("Use the normal context");
//  void set globalCompositeOperation(string newOperation) {
//    throw new UnimplementedError("Use the normal context");
//  }
//  
//  
//  String get strokeStyle => throw new UnimplementedError("Use the normal context");
//  void set strokeStyle(String newStrokeStyle) {
//    throw new UnimplementedError("Use the normal context");
//  }

    
    AdjustedContext(int viewportWidth, int viewportHeight, double screenRatio) {
      yAdjust = viewportHeight * (1 - screenRatio);
      xAdjust = viewportWidth * (1 - screenRatio) * 0.3;// Is 1.8 a magic number?
    }
    
    void arc(num x, num y, num radius, num startAngle, num endAngle, [bool anticlockwise=false]){
      context.arc(
          (x - Camera.instance.x) * Camera.instance.screenRatio + xAdjust, 
          (y - Camera.instance.y) * Camera.instance.screenRatio + yAdjust, 
          radius * Camera.instance.screenRatio, 
          startAngle, 
          endAngle);
    }
    
    void rect(num x, num y, num width, num height) {
      context.rect(
          (x - Camera.instance.x) * Camera.instance.screenRatio + xAdjust, 
          (y - Camera.instance.y) * Camera.instance.screenRatio + yAdjust, 
          width * Camera.instance.screenRatio, 
          height * Camera.instance.screenRatio);
    }
    
    void clearRect(num x, num y, num width, num height) {
      context.clearRect(
          (x - Camera.instance.x) * Camera.instance.screenRatio + xAdjust, 
          (y - Camera.instance.y) * Camera.instance.screenRatio + yAdjust, 
          width * Camera.instance.screenRatio, 
          height * Camera.instance.screenRatio);
    }
    
    void fillRect(num x, num y, num width, num height) {
      context.fillRect(
          (x - Camera.instance.x) * Camera.instance.screenRatio + xAdjust, 
          (y - Camera.instance.y) * Camera.instance.screenRatio + yAdjust, 
          width * Camera.instance.screenRatio, 
          height * Camera.instance.screenRatio);
    }
    
    void fillText(String text, num x, num y, [num maxWidth]){
      context.fillText(text, 
          (x - Camera.instance.x) * Camera.instance.screenRatio + xAdjust, 
          (y - Camera.instance.y) * Camera.instance.screenRatio  + yAdjust);//, [numMaxWidth]); //TODO fix this
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
          (x - Camera.instance.x) * Camera.instance.screenRatio + xAdjust, 
          (y - Camera.instance.y) * Camera.instance.screenRatio + yAdjust);
    }
    
    void moveTo(num x, num y) {
      context.moveTo(
          (x - Camera.instance.x) * Camera.instance.screenRatio + xAdjust, 
          (y - Camera.instance.y) * Camera.instance.screenRatio  + yAdjust);
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
          (destX - Camera.instance.x) * Camera.instance.screenRatio + xAdjust, 
          (destY - Camera.instance.y) * Camera.instance.screenRatio  + yAdjust, 
          destWidth * Camera.instance.screenRatio, 
          destHeight* Camera.instance.screenRatio);
    }
    
// Does not need to be adjusted, it is relative
    // I'm not sure this is right.  Still have issues
    // in some implementations
    void scale(num sx, num sy){
      context.scale(
          sx , 
          sy);
    }
    
    void translate(num tx , num ty) {
      context.translate(
          tx * Camera.instance.screenRatio , 
          ty * Camera.instance.screenRatio );
    }
    
  }