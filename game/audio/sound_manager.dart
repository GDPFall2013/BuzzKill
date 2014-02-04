part of gdp;

/**
 * The Sound Manager handles Audio
 * It is a singleton so it is accessible from anywhere
 */
class SoundManager {
  
  //AudioManager audioManager = new AudioManager('content/Sound Files');
 // AudioSource sfxSource;
  
  AudioContext ac = new AudioContext();
  AudioBufferSourceNode source;
  
  
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
  
  AudioBuffer _jumpClip;
  AudioBuffer _oxygenClip;
  AudioBuffer _shipItemClip;
  AudioBuffer _injureClip;
 
  static final int enumSoundJump = 1;
  static final int enumSoundOxygen = 2;
  static final int enumSoundShipItem = 3;
  static final int enumSoundInjure = 4;
  
  GainNode volume;
  int volumeNumber;
  
  init(){
    loadSounds();
    volume = ac.createGain();
    source = ac.createBufferSource();
    source.connectNode(volume);
    volume.connectNode(ac.destination);
    volumeNumber = 50;
    volume.gain.value = volumeNumber;
    
   // loadSound('content/Sound Files/SlowJump.wav', jumpClip);
   // loadSound('content/Sound Files/Oxygen.wav', _oxygenClip);
   // loadSound('content/Sound Files/ShipItem.wav', _shipItemClip);
   // loadSound('content/Sound Files/Injured.wav', _injureClip);
  }
  
  void loadSounds() {

    HttpRequest.request('content/Sound Files/SlowJump.wav', responseType: 'arraybuffer')
        .then((HttpRequest request) {
          ac.decodeAudioData(request.response)
              .then((AudioBuffer buffer) { 
               // clip = buffer ;  Making this a parameter does not work. Can't tell why
                _jumpClip = buffer;   // it works when non generic.
              });
        });
    HttpRequest.request('content/Sound Files/Oxygen.wav', responseType: 'arraybuffer')
      .then((HttpRequest request) {
        ac.decodeAudioData(request.response)
          .then((AudioBuffer buffer) { 
            _oxygenClip = buffer;
          });
      });
    HttpRequest.request('content/Sound Files/ShipItem.wav', responseType: 'arraybuffer')
      .then((HttpRequest request) {
        ac.decodeAudioData(request.response)
          .then((AudioBuffer buffer) { 
            _shipItemClip = buffer;
          });
      });
    HttpRequest.request('content/Sound Files/Injured.wav', responseType: 'arraybuffer')
      .then((HttpRequest request) {
        ac.decodeAudioData(request.response)
          .then((AudioBuffer buffer) { 
            _injureClip = buffer;
          });
      });
  }
  
  void setMusic( int newMusic) {
  //  audioManager.music.clip = null;
    // load correct piece of music
  //  audioManager.music.clip = _currentMusic;
  }
  
  void startMusic(){
    /// audioManager.music.play();
  }
 
  
  //Loads music then calls the function when finished
  void loadMusic(Function callback){
    //_currentMusic.load().then((_) {
   //   callback();
   // });
  }
  
  void stopMusic() {
   // audioManager.music.stop();
  }
  
  void pauseMusic() {
   // audioManager.pauseMusic();
  }
  
  void resumeMusic() {
  //  audioManager.resumeMusic();
  }
  
  void pauseAll() {
  //  audioManager.pauseAll();
  }
  
  void resumeAll() {
   // audioManager.resumeAll();
  }
  
  //TODO:  Refactor these so they follow Dart's ability to hide getters and setters
  num getMusicVolume() {
  //  return audioManager.musicVolume;
  }
  
  num getSfxVolume() {
  //  return sfxSource.volume;
  }
  
  void setSfxVolume(num newVolume) {
  //  sfxSource.volume = newVolume;
  }
  
  void setMusicVolume(num newVolume) {
  //  audioManager.musicVolume = newVolume;
  }
  
  void toggleMute() {
    if (volume.gain.value == 0) {
      volume.gain.value = volumeNumber;
    } else {
      volume.gain.value = 0;
    }
  }
 

  void playSound(int enumSound){
    if (_muted){
      return;
    } else {
      AudioBufferSourceNode source = ac.createBufferSource();
      source.connectNode(ac.destination);
      
      switch(enumSound) {  
        // enums aren't implemented yet, and switch only takes constants at the moment.
        case 1: 
          source.buffer = _jumpClip;
          source.start(0);
          break;  
        case 2: 
          source.buffer = _oxygenClip;
          source.start(0);
          break;
        case 3: 
          source.buffer = _shipItemClip;
          source.start(0);
          break;
        case 4: 
          source.buffer = _injureClip;
          source.start(0);
          break;
      }
    }
  } 
}