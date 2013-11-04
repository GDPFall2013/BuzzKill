part of gdp;

class SoundManager {
  
  AudioManager audioManager = new AudioManager('content/Sound Files');
  AudioSource sfxSource;
  
  static SoundManager instance;
  factory SoundManager() {
    if (instance == null) {
      instance = new SoundManager._internal();
      instance.init();
    }
    return instance;
  }
  SoundManager._internal();
  
  bool _muted = false;
  
  AudioClip _jumpClip;
  
  AudioClip _currentMusic;
 
  static final int enumSoundJump = 1;
  
  init(){
    sfxSource = this.audioManager.makeSource('sfxSource');
    
    _jumpClip = audioManager.makeClip('jump', 'fastinvader3Wave.wav');
    _jumpClip.load();
  }
  
  void setMusic( int newMusic) {
    audioManager.music.clip = null;
    // load correct piece of music
    audioManager.music.clip = _currentMusic;
  }
  
  void startMusic(){
     audioManager.music.play();
  }
 
  
  //Loads music then calls the function when finished
  void loadMusic(Function callback){
    _currentMusic.load().then((_) {
      callback();
    });
  }
  
  void stopMusic() {
    audioManager.music.stop();
  }
  
  void pauseMusic() {
    audioManager.pauseMusic();
  }
  
  void resumeMusic() {
    audioManager.resumeMusic();
  }
  
  void pauseAll() {
    audioManager.pauseAll();
  }
  
  void resumeAll() {
    audioManager.resumeAll();
  }
  
  //TODO:  Refactor these so they follow Dart's ability to hide getters and setters
  num getMusicVolume() {
    return audioManager.musicVolume;
  }
  
  num getSfxVolume() {
    return sfxSource.volume;
  }
  
  void setSfxVolume(num newVolume) {
    sfxSource.volume = newVolume;
  }
  
  void setMusicVolume(num newVolume) {
    audioManager.musicVolume = newVolume;
  }
  
  void toggleMute() {
    audioManager.mute = !audioManager.mute;
  }
 

  void playSound(int enumSound){
    if (_muted){
      return;
    } else {
      switch(enumSound) {  
        // enums aren't implemented yet, and switch only takes constants at the moment.
        case 1: 
          audioManager.playClipFromSource('sfxSource', 'jump');
          break;       
      }
    }
  } 
}