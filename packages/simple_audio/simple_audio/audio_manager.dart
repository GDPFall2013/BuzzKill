/*
  Copyright (C) 2012 John McCutchan <john@johnmccutchan.com>

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
*/
part of simple_audio;

/** The [AudioManager] class is the main entry point to the [simple_audio]
 * library. You can create [AudioClip]s and [AudioSource]s with the manager.
 * You can play clips from sources with the manager.
 *
 * The [AudioManager] also has a listener which picks up sounds from
 * [AudioSource]s. The sound picked up by the listener from the [AudioSource]s
 * is played through the real, physical speakers attached to the computer.
 *
 */
class AudioManager {
  AudioContext _context;
  AudioDestinationNode _destination;
  AudioListener _listener;

  GainNode _masterGain;
  GainNode _musicGain;
  GainNode _sourceGain;

  String baseURL;

  Map<String, AudioClip> _clips = new Map<String, AudioClip>();
  Map<String, AudioSource> _sources = new Map<String, AudioSource>();
  AudioMusic _music;

  /** Construct a new AudioManager,
   * can specify [baseURL] which is prepended to all clip URLs.
   * [baseURL] defaults to '/'
   */
  AudioManager([this.baseURL = '']) {
    _context = new AudioContext();
    _destination = _context.destination;
    _listener = _context.listener;

    _masterGain = _context.createGain();
    _musicGain = _context.createGain();
    _sourceGain = _context.createGain();

    _masterGain.connectNode(_destination, 0, 0);
    _musicGain.connectNode(_masterGain, 0, 0);
    _sourceGain.connectNode(_masterGain, 0, 0);

    _music = new AudioMusic._internal(this, _musicGain);
  }

  Map toJson() {
    Map map = new Map();
    map['masterVolume'] = _masterGain.gain.value;
    map['musicVolume'] = _musicGain.gain.value;
    map['sourceVolume'] = _sourceGain.gain.value;
    map['clips'] = _clips;
    map['sources'] = _sources;
    map['music'] = _music;

    return map;
  }

  void fromMap(Map map) {
    _masterGain.gain.value = map['masterVolume'];
    _musicGain.gain.value = map['musicVolume'];
    _sourceGain.gain.value = map['sourceVolume'];
    _clips = new Map<String,AudioClip>();
    map['clips'].forEach((k,v) {
      _clips[k] = new AudioClip._internal(this, k, null).fromMap(v);
      _clips[k].load();
    });
    _sources = new Map<String,AudioSource>();
    map['sources'].forEach((k,v) {
      _sources[k] = new AudioSource._internal(this, k, _sourceGain).fromMap(v);
    });
    _music.fromMap(map['music']);
  }

  /** Sample rate of the audio driver */
  num get sampleRate => _context.sampleRate;

  /** Get the music volume. */
  num get musicVolume => _musicGain.gain.value;
  /** Set the music volume. */
  void set musicVolume(num mv) {
    _musicGain.gain.value = mv;
  }

  /** Get the master volume. */
  num get masterVolume => _masterGain.gain.value;
  /** Set the master volume. */
  void set masterVolume(num mv) {
    mute = false;
    _masterGain.gain.value = mv;
  }

  /** Get the sources volume */
  num get sourceVolume => _sourceGain.gain.value;
  /** Set the sources volume */
  void set sourceVolume(num mv) {
    _sourceGain.gain.value = mv;
  }

  num _mutedVolume;
  /** Is the master volume muted? */
  bool get mute => _mutedVolume != null;

  /** Control the master mute */
  void set mute(bool b) {
    if (b) {
     if (_mutedVolume != null) {
       // Double mute.
       return;
     }
     _mutedVolume = _masterGain.gain.value;
     _masterGain.gain.value = 0;
    } else {
      if (_mutedVolume == null) {
        // Double unmute.
        return;
      }
      _masterGain.gain.value = _mutedVolume;
      _mutedVolume = null;
    }
  }

  /** Pause both music and source based sounds. */
  void pauseAll() {
    pauseSources();
    pauseMusic();
  }

  /** Resume both music and source based sounds. */
  void resumeAll() {
    resumeSources();
    resumeMusic();
  }

  bool _musicPaused = false;
  /** Pause music sounds */
  void pauseMusic() {
    _music.pause = true;
    _musicPaused = true;
  }
  /** Resume music sounds */
  void resumeMusic() {
    _music.pause = false;
    _musicPaused = false;
  }

  bool _sourcesPaused = false;
  /** Pause source base sounds. */
  void pauseSources() {
    _sources.forEach((k,v) {
      v.pause = true;
    });
    _sourcesPaused = true;
  }

  /** Resume source base sounds. */
  void resumeSources() {
    _sources.forEach((k,v) {
      v.pause = false;
    });
    _sourcesPaused = false;
  }

  /** Find the audio clip with [name] */
  AudioClip findClip(String name) {
    return _clips[name];
  }

  /** Find the audio source with [name] */
  AudioSource findSource(String name) {
    return _sources[name];
  }

  /** Get the [AudioMusic] singleton. */
  AudioMusic get music => _music;

  /** Create an [AudioClip] with [name]. */
  AudioClip makeClip(String name, String url) {
    AudioClip clip = _clips[name];
    if (clip != null) {
      return clip;
    }
    clip = new AudioClip._internal(this, name, url);
    _clips[name] = clip;
    return clip;
  }

  /** Batch create many clips. */
  List<AudioClip> makeClips(List<String> names, List<String> urls) {
    if (names == null || urls == null ||
        (names.length != urls.length)) {
      throw new ArgumentError('Invalid arguments.');
    }
    List<AudioClip> clips = new List<AudioClip>();
    for (int i = 0; i < names.length; i++) {
      clips.add(makeClip(names[i], urls[i]));
    }
  }

  AudioClip removeClip(String name) => _clips.remove(name);

  /** Batch load all clips not marked as ready to play.
   * Returns a single Future which will complete once all the clips have loaded.
   */
  Future<List<AudioClip>> loadClips() {
    List<Future<AudioClip>> loaded = new List<Future<AudioClip>>();
    _clips.forEach((name, clip) {
      if (clip.isReadyToPlay == false) {
        loaded.add(clip.load());
      }
    });
    return Future.wait(loaded);
  }

  /** Create an [AudioSource] and assign it [name] */
  AudioSource makeSource(String name) {
    AudioSource source = _sources[name];
    if (source != null) {
      return source;
    }
    source = new AudioSource._internal(this, name, _sourceGain);
    _sources[name] = source;
    return source;
  }

  /** Play [clipName] from [sourceName]. */
  AudioSound playClipFromSource(String sourceName, String clipName, [bool looped=false]) {
    return playClipFromSourceIn(0.0, sourceName, clipName, looped);
  }

  /** Play [clipName] from [sourceName] in [delay] seconds. */
  AudioSound playClipFromSourceIn(num delay, String sourceName, String clipName, [bool looped=false]) {
    AudioSource source = _sources[sourceName];
    if (source == null) {
      // TODO(johnmccutchan): Determine error route.
      print('Could not find source $sourceName');
      return null;
    }
    AudioClip clip = _clips[clipName];
    if (clip == null) {
      // TODO(johnmccutchan): Determine error route.
      print('Could not find clip $clipName');
      return null;
    }
    if (looped) {
      return source.playLoopedIn(delay, clip);
    } else {
      return source.playOnceIn(delay, clip);
    }
  }

  /** Stop all sounds originating from [sourceName] */
  void stopSource(String sourceName) {
    AudioSource source = _sources[sourceName];
    if (source == null) {
      // TODO(johnmccutchan): Determine error route.
      print('Could not find source $sourceName');
      return;
    }
    source.stop();
  }

  /** Pause all sounds originating from [sourceName] */
  void pauseSource(String sourceName) {
    AudioSource source = _sources[sourceName];
    if (source == null) {
      // TODO(johnmccutchan): Determine error route.
      print('Could not find source $sourceName');
      return;
    }
    source.pause = true;
  }

  /** Resume all sounds originating from [sourceName] */
  void resumeSource(String sourceName) {
    AudioSource source = _sources[sourceName];
    if (source == null) {
      // TODO(johnmccutchan): Determine error route.
      print('Could not find source $sourceName');
      return;
    }
    source.pause = false;
  }

  num get dopplerFactor => _listener.dopplerFactor;

  void set dopplerFactor(num df) {
    _listener.dopplerFactor = df;
  }

  num get speedOfSound => _listener.speedOfSound;

  void set speedOfSound(num sos) {
    _listener.speedOfSound = sos;
  }

  void setPosition(num x, num y, num z) {
    _listener.setPosition(x, y, z);
  }

  void setVelocity(num x, num y, num z) {
    _listener.setVelocity(x, y, z);
  }
}

/* TODO:
 * Allow clips and sources to be deleted.
 *
 * Snapshot:
 *  Ensure all properties are saved.
 *
 * Demo Common:
 *  Clip Table
 *    Draggable
 *    Add a new Clip
 *    Change a clip URL
 *    Load a clip
 *  Source Table
 *    Add a new source
 *    Change a source position and orientation
 * Basic Demo:
 *  Add clip selection drop down (not just scream).
 *  Add music selection drop down (1 more song).
 *  Add clip selection to each source.
 */
