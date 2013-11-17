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

/** [AudioMusic] plays a clip from an omnidirectional [AudioSource].
 */
class AudioMusic {
  final AudioManager _manager;
  AudioSource _source;
  AudioSound _sound;
  AudioClip _clip;
  AudioMusic._internal(this._manager, GainNode output) {
    _source = new AudioSource._internal(_manager, 'music', output);
    _source.positional = false;
  }

  Map toJson() {
    Map map = new Map();
    map['clipName'] = _clip._name;
    return map;
  }

  void fromMap(Map map) {
    _clip = _manager.findClip(map['clipName']);
  }

  void _stop() {
    if (_sound != null) {
      _sound.stop();
      _sound = null;
    }
  }

  /** Is the music paused? */
  bool get pause => _sound == null ? false : _sound.pause;
  /** Pause or unpause the music */
  void set pause(bool b) {
    if (_sound != null) {
      _sound.pause = b;
    }
  }

  AudioClip get clip => _clip;

  void set clip(AudioClip clip) {
    _clip = clip;
  }

  /** Play the music clip. The music will loop. */
  void play({loop: true}) {
    _stop();
    _sound = new AudioSound._internal(_source, _clip, loop);
    _sound.play();
  }

  /** Crossfades linear to the music [clip] with [delay] and [fadeDuration]. The music will loop. */
  void crossFadeLinear(num delay, num fadeDuration, AudioClip clip) {
    var nextTrack = new AudioSound._internal(_source, clip, true);
    _sound.fadeOut(delay, fadeDuration);
    nextTrack.fadeIn(delay, fadeDuration);
    _sound = nextTrack;
  }


  /** Stop the music. */
  void stop() {
    _stop();
  }
}