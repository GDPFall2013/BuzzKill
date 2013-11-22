part of gdp;

/**
 * The Sound Manager is the class that interfaces with the Simpl Audio Library
 * It is a singleton so it is accessible from anywhere
 */
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
  AudioClip _oxygenClip;
  AudioClip _shipItemClip;
  AudioClip _injureClip;
  
  AudioClip _currentMusic;
 
  static final int enumSoundJump = 1;
  static final int enumSoundOxygen = 2;
  static final int enumSoundShipItem = 3;
  static final int enumSoundInjure = 4;
  
  init(){
    sfxSource = this.audioManager.makeSource('sfxSource');
    
    _jumpClip = audioManager.makeClip('jump', 'fastinvader3Wave.wav');
    _jumpClip.load();
    
    _oxygenClip = audioManager.makeClip('oxygen', 'fastinvader4Wave.wav');
    _oxygenClip.load();
    
    _shipItemClip = audioManager.makeClip('shipItem', 'ufo_lowpitchWave.wav');
    _shipItemClip.load();
    
    _injureClip = audioManager.makeClip('injure', 'invaderKilledWave.wav');
    _injureClip.load();
    
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
        case 2: 
          audioManager.playClipFromSource('sfxSource', 'oxygen');
          break;
        case 3: 
          audioManager.playClipFromSource('sfxSource', 'shipItem');
          break;
        case 4: 
          audioManager.playClipFromSource('sfxSource', 'injure');
          break;
      }
    }
  } 
}