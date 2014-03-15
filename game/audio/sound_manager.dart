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
  AudioBufferSourceNode musicSource;
  
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
  AudioBuffer _deathClip;
  AudioBuffer _shootClip;
  AudioBuffer _gsmashClip;
  AudioBuffer _springClip;
  AudioBuffer _cyraxNetClip;
  AudioBuffer _cyraxShurikenClip;
  AudioBuffer _cyraxMiniShurikenClip;
  
  
  AudioBuffer _mainMenuMusicClip;
  AudioBuffer _levelOneMusicClip;
  
  AudioBuffer _currentMusic;
 
  static final int enumSoundJump = 1;
  static final int enumSoundOxygen = 2;
  static final int enumSoundShipItem = 3;
  static final int enumSoundInjure = 4;
  static final int enumSoundDeath = 5;
  static final int enumSoundShoot = 6;
  static final int enumSoundGSmash = 7;
  static final int enumSoundSpring = 8;
  static final int enumSoundCyraxNet = 9;
  static final int enumSoundCyraxShuriken = 10;
  static final int enumSoundCyraxMiniShuriken = 11;
  
  static final int musicMainMenu = 1;
  static final int musicLevelOne = 2;
  
  GainNode sfxVolume;
  double sfxVolumeNumber;
  GainNode musicVolume;
  double musicVolumeNumber;
  
  init(){
    loadSounds();
    sfxVolume = ac.createGain();
     source = ac.createBufferSource();
     source.connectNode(sfxVolume);
     sfxVolume.connectNode(ac.destination);
     sfxVolumeNumber = 0.5;
     sfxVolume.gain.value = sfxVolumeNumber;
     
     musicVolume = ac.createGain();
     musicSource = ac.createBufferSource();
     musicSource.connectNode(musicVolume);
     musicVolume.connectNode(ac.destination);
     musicVolumeNumber = 0.5;
     musicVolume.gain.value = musicVolumeNumber;
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
    HttpRequest.request('content/Sound Files/Death.wav', responseType: 'arraybuffer')
      .then((HttpRequest request) {
        ac.decodeAudioData(request.response)
          .then((AudioBuffer buffer) { 
            _deathClip = buffer;
          });
      });
    HttpRequest.request('content/Sound Files/Shoot.wav', responseType: 'arraybuffer')
      .then((HttpRequest request) {
        ac.decodeAudioData(request.response)
          .then((AudioBuffer buffer) { 
            _shootClip = buffer;
          });
      });
    HttpRequest.request('content/Sound Files/GSmash.wav', responseType: 'arraybuffer')
      .then((HttpRequest request) {
        ac.decodeAudioData(request.response)
          .then((AudioBuffer buffer) { 
            _gsmashClip = buffer;
          });
      });
    HttpRequest.request('content/Sound Files/Spring.wav', responseType: 'arraybuffer')
      .then((HttpRequest request) {
        ac.decodeAudioData(request.response)
          .then((AudioBuffer buffer) { 
            _springClip = buffer;
          });
      });
    HttpRequest.request('content/Sound Files/CyraxNet.wav', responseType: 'arraybuffer')
      .then((HttpRequest request) {
        ac.decodeAudioData(request.response)
          .then((AudioBuffer buffer) { 
            _cyraxNetClip = buffer;
          });
      });
    HttpRequest.request('content/Sound Files/CyraxShuriken.wav', responseType: 'arraybuffer')
      .then((HttpRequest request) {
        ac.decodeAudioData(request.response)
          .then((AudioBuffer buffer) { 
            _cyraxShurikenClip = buffer;
          });
      });
    HttpRequest.request('content/Sound Files/CyraxMiniShuriken.wav', responseType: 'arraybuffer')
      .then((HttpRequest request) {
        ac.decodeAudioData(request.response)
          .then((AudioBuffer buffer) { 
            _cyraxMiniShurikenClip = buffer;
          });
      });
  }
  
  void setMusic( int newMusic) {
        _currentMusic = null;
       if        (newMusic == musicMainMenu) {
         _currentMusic = _mainMenuMusicClip;
       } else if (newMusic == musicLevelOne){
         _currentMusic = _levelOneMusicClip;
       }
  }
  
  void startMusic(){
     musicSource = ac.createBufferSource();
     musicSource.connectNode(musicVolume);
     musicSource.buffer = _currentMusic;
     musicSource.loop = true;
     musicSource.start(0);
  }
 
  
  //Loads music then calls the function when finished
  void loadMusic(int musicClip, Function callback){
    switch(musicClip) {  
          // enums aren't implemented yet, and switch only takes constants at the moment.
          case 1: //(musicMainMenu)
            HttpRequest.request('content/Sound Files/MainMenu.wav', responseType: 'arraybuffer')
              .then((HttpRequest request) {
                ac.decodeAudioData(request.response)
                  .then((AudioBuffer buffer) { 
                    _mainMenuMusicClip = buffer;  
                    callback();
                  });
              });
            break;
          case 2: //(musicLevelOne)
            HttpRequest.request('content/Sound Files/LevelMusic.wav', responseType: 'arraybuffer')
              .then((HttpRequest request) {
                ac.decodeAudioData(request.response)
                  .then((AudioBuffer buffer) { 
                    _levelOneMusicClip = buffer;
                    callback();
                  });
              });
            break;  
        }
  }
  
  void stopMusic() {
    if (musicSource != null && musicSource.buffer != null) {
             musicSource.stop(0);
       }
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
   double getMusicVolume() {
     return musicVolumeNumber;
   }
   
   double getSfxVolume() {
    return sfxVolumeNumber;
   }
   
   void setSfxVolume(num newVolume) {
     sfxVolumeNumber = newVolume;
     sfxVolume.gain.value = sfxVolumeNumber;
   }
   
   void setMusicVolume(num newVolume) {
     musicVolumeNumber = newVolume;
     musicVolume.gain.value = musicVolumeNumber;
   }
   
   void toggleMute() {
     if (_muted) {
       sfxVolume.gain.value = sfxVolumeNumber;
       musicVolume.gain.value = musicVolumeNumber;
       _muted = false;
     } else {
       sfxVolume.gain.value = 0;
       musicVolume.gain.value = 0;
       _muted = true;
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
        case 5: 
          source.buffer = _deathClip;
          source.start(0);
          break;
        case 6: 
          source.buffer = _shootClip;
          source.start(0);
          break;
        case 7: 
          source.buffer = _gsmashClip;
          source.start(0);
          break;
        case 8: 
          source.buffer = _springClip;
          source.start(0);
          break;
        case 9: 
          source.buffer = _cyraxNetClip;
          source.start(0);
          break;
        case 10: 
          source.buffer = _cyraxShurikenClip;
          source.start(0);
          break;
        case 11: 
          source.buffer = _cyraxMiniShurikenClip;
          source.start(0);
          break;
      }
    }
  } 
}