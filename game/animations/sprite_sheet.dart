part of gdp;

 
/**
 * A SpriteSheet (SS) is a set of sprites that make up an animation for an object.
 * They can either be line drawings, or images.
 */

class SpriteSheet {

  int spritex;
  int spritey;
  int _framew;
  int _frameh;  
  String _imgurl = "";
  ImageElement _img;
  
  SpriteSheet(this._imgurl, this.spritex, this.spritey,this._framew,this._frameh)
  {
    _img = ImageLoader.getImage(_imgurl);     
  }
  
  drawOnPosition(double x, double y, double frameX, double frameY)
  {
    context.drawImageScaledFromSource(_img,spritex,spritey,_framew,_frameh, x,y,_framew,_frameh);
  }
  
  drawOnPositionn(double x, double y, double frameX, double frameY)
    {
      normContext.drawImageScaledFromSource(_img,spritex,spritey,_framew,_frameh, x,y,_framew,_frameh);
    }
}


class ImageLoader {
  
static Map<String,ImageElement> bufferedImages;
  
//loads/buffers new images into map (using URL as key) for future use
  static ImageElement loadImage(String url)
  {
    if(bufferedImages == null)
      bufferedImages = new Map<String,ImageElement>();
    
    ImageElement img = new Element.tag("img");
    img.src = url;
    bufferedImages[url] = img;
    
    return img;
  }
  
 
  //returns image as per URL
  static ImageElement getImage(String url)
  {
    if(bufferedImages == null)
      bufferedImages = new Map<String,ImageElement>();
    
    if(bufferedImages.containsKey(url))
      return bufferedImages[url];
    return loadImage(url);
  }
  
}