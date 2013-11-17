/*
  Copyright (C) 2013 David Bernard <david.bernard.31@gmail.com>

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

// Port of https://github.com/mneubrand/jsfxr and https://code.google.com/p/as3sfxr/

class SfxrParams {
  /// Shape of the wave (0:square, 1:saw, 2:sin or 3:noise)
  int waveType               = 0;
  /// Length of the volume envelope attack (0 to 1)
  double attackTime          = 0.0;
  /// Length of the volume envelope sustain (0 to 1)
  double sustainTime         = 0.0;
  /// Tilts the sustain envelope for more 'pop' (0 to 1)
  double sustainPunch        = 0.0;
  /// Length of the volume envelope decay (yes, I know it's called release) (0 to 1)
  double decayTime           = 0.0;
  /// Base note of the sound (0 to 1)
  double startFrequency      = 0.3;
  /// If sliding, the sound will stop at this frequency, to prevent really low notes (0 to 1)
  double minFrequency        = 0.0;
  /// Slides the note up or down (-1 to 1)
  double slide               = 0.0;
  /// Accelerates the slide (-1 to 1)
  double deltaSlide          = 0.0;
  /// Strength of the vibrato effect (0 to 1)
  double vibratoDepth        = 0.0;
  /// Speed of the vibrato effect (i.e. frequency) (0 to 1)
  double vibratoSpeed        = 0.0;
  /// Shift in note, either up or down (-1 to 1)
  double changeAmount        = 0.0;
  /// How fast the note shift happens (only happens once) (0 to 1)
  double changeSpeed         = 0.0;
  /// Controls the ratio between the up and down states of the square wave, changing the tibre (0 to 1)
  double squareDuty          = 0.0;
  /// Sweeps the duty up or down (-1 to 1)
  double dutySweep           = 0.0;
  /// Speed of the note repeating - certain variables are reset each time (0 to 1)
  double repeatSpeed         = 0.0;
  /// Offsets a second copy of the wave by a small phase, changing the tibre (-1 to 1)
  double phaserOffset        = 0.0;
  /// Sweeps the phase up or down (-1 to 1)
  double phaserSweep         = 0.0;
  /// Frequency at which the low-pass filter starts attenuating higher frequencies (0 to 1)
  double lpFilterCutoff      = 0.0;
  /// Sweeps the low-pass cutoff up or down (-1 to 1)
  double lpFilterCutoffSweep = 0.0;
  /// Changes the attenuation rate for the low-pass filter, changing the timbre (0 to 1)
  double lpFilterResonance   = 0.0;
  /// Frequency at which the high-pass filter starts attenuating lower frequencies (0 to 1)
  double hpFilterCutoff      = 0.0;
  /// Sweeps the high-pass cutoff up or down (-1 to 1)
  double hpFilterCutoffSweep = 0.0;
  /// Overall volume of the sound (0 to 1)
  double masterVolume        = 0.0;

  //--------------------------------------------------------------------------
  //
  //  Settings String Methods
  //
  //--------------------------------------------------------------------------

  /**
   * Parses a settings string into the parameters
   * @param string Settings string to parse
   * @return If the string successfully parsed
   */
  SfxrParams.fromString(String string) {
    var values = string.split(",");
    this.waveType            = _toInt(values[ 0]);
    this.attackTime          = _toDouble(values[ 1]);
    this.sustainTime         = _toDouble(values[ 2]);
    this.sustainPunch        = _toDouble(values[ 3]);
    this.decayTime           = _toDouble(values[ 4]);
    this.startFrequency      = _toDouble(values[ 5]);
    this.minFrequency        = _toDouble(values[ 6]);
    this.slide               = _toDouble(values[ 7]);
    this.deltaSlide          = _toDouble(values[ 8]);
    this.vibratoDepth        = _toDouble(values[ 9]);
    this.vibratoSpeed        = _toDouble(values[10]);
    this.changeAmount        = _toDouble(values[11]);
    this.changeSpeed         = _toDouble(values[12]);
    this.squareDuty          = _toDouble(values[13]);
    this.dutySweep           = _toDouble(values[14]);
    this.repeatSpeed         = _toDouble(values[15]);
    this.phaserOffset        = _toDouble(values[16]);
    this.phaserSweep         = _toDouble(values[17]);
    this.lpFilterCutoff      = _toDouble(values[18]);
    this.lpFilterCutoffSweep = _toDouble(values[19]);
    this.lpFilterResonance   = _toDouble(values[20]);
    this.hpFilterCutoff      = _toDouble(values[21]);
    this.hpFilterCutoffSweep = _toDouble(values[22]);
    this.masterVolume        = _toDouble(values[23]);

    // I moved this here from the reset(true) function
    if (this.sustainTime < .01) {
      this.sustainTime = .01;
    }

    var totalTime = this.attackTime + this.sustainTime + this.decayTime;
    if (totalTime < .18) {
      var multiplier = .18 / totalTime;
      this.attackTime  *= multiplier;
      this.sustainTime *= multiplier;
      this.decayTime   *= multiplier;
    }
  }

  /**
   * Sets the parameters to generate a pickup/coin sound
   */
  SfxrParams.generatePickupCoin() {
    var random = new math.Random();

    startFrequency = 0.4 + random.nextDouble() * 0.5;

    sustainTime = random.nextDouble() * 0.1;
    decayTime = 0.1 + random.nextDouble() * 0.4;
    sustainPunch = 0.3 + random.nextDouble() * 0.3;

    if(random.nextDouble() < 0.5){
      changeSpeed = 0.5 + random.nextDouble() * 0.2;
      changeAmount = 0.2 + random.nextDouble() * 0.4;
    }
  }

  static int _toInt(String v) {
    if (v == null || v.length == 0) {
      return 0;
    }
    return int.parse(v, radix: 10);
  }

  static double _toDouble(String v) {
    if (v == null || v.length == 0) {
      return 0.0;
    }
    return double.parse(v);
  }
}

class SfxrSynth {

  final SfxrParams _params;

  //--------------------------------------------------------------------------
  //
  //  Synth Variables
  //
  //--------------------------------------------------------------------------

  double
      _envelopeLength0, // Length of the attack stage
      _envelopeLength1, // Length of the sustain stage
      _envelopeLength2, // Length of the decay stage

      _period,          // Period of the wave
      _maxPeriod,       // Maximum period before sound stops (from minFrequency)

      _slide,           // Note slide
      _deltaSlide,      // Change in slide

      _changeAmount,    // Amount to change the note by

      _squareDuty,      // Offset of center switching point in the square wave
      _dutySweep;       // Amount to change the duty by
  int _changeTime,      // Counter for the note change
      _changeLimit;     // Once the time reaches this limit, the note changes

  //--------------------------------------------------------------------------
  //
  //  Synth Methods
  //
  //--------------------------------------------------------------------------
  SfxrSynth(SfxrParams this._params);

  /**
   * Resets the runing variables from the params
   * Used once at the start (total reset) and for the repeat effect (partial reset)
   */
  void reset() {
    // Shorter reference
    var p = this._params;

    _period       = 100 / (p.startFrequency * p.startFrequency + .001);
    _maxPeriod    = 100 / (p.minFrequency   * p.minFrequency   + .001);

    _slide        = 1 - p.slide * p.slide * p.slide * .01;
    _deltaSlide   = -p.deltaSlide * p.deltaSlide * p.deltaSlide * .000001;

    if (p.waveType == 0) {
      _squareDuty = .5 - p.squareDuty / 2;
      _dutySweep  = -p.dutySweep * .00005;
    }

    _changeAmount = p.changeAmount > 0 ? 1 - p.changeAmount * p.changeAmount * .9 : 1 + p.changeAmount * p.changeAmount * 10;
    _changeTime   = 0;
    _changeLimit  = (p.changeSpeed == 1 ? 0 : (1 - p.changeSpeed) * (1 - p.changeSpeed) * 20000 + 32).toInt();
  }

  // I split the reset() function into two functions for better readability
  int totalReset() {
    this.reset();

    // Shorter reference
    var p = this._params;

    // Calculating the length is all that remained here, everything else moved somewhere
    _envelopeLength0 = p.attackTime  * p.attackTime  * 100000;
    _envelopeLength1 = p.sustainTime * p.sustainTime * 100000;
    _envelopeLength2 = p.decayTime   * p.decayTime   * 100000 + 10;
    // Full length of the volume envelop (and therefore sound)
    return (_envelopeLength0 + _envelopeLength1 + _envelopeLength2).toInt(); // | 0;
  }

  /**
   * Writes the wave to the supplied buffer ByteArray
   * @param buffer A ByteArray to write the wave to
   * @return If the wave is finished
   */
  bool synthWave(Float32List buffer, int length) {
    // Shorter reference
    var p = this._params;

    // If the filters are active
    var _filters = p.lpFilterCutoff != 1 || p.hpFilterCutoff != 0,
        // Cutoff multiplier which adjusts the amount the wave position can move
        _hpFilterCutoff = p.hpFilterCutoff * p.hpFilterCutoff * .1,
        // Speed of the high-pass cutoff multiplier
        _hpFilterDeltaCutoff = 1 + p.hpFilterCutoffSweep * .0003,
        // Cutoff multiplier which adjusts the amount the wave position can move
        _lpFilterCutoff = p.lpFilterCutoff * p.lpFilterCutoff * p.lpFilterCutoff * .1,
        // Speed of the low-pass cutoff multiplier
        _lpFilterDeltaCutoff = 1 + p.lpFilterCutoffSweep * .0001,
        // If the low pass filter is active
        _lpFilterOn = p.lpFilterCutoff != 1,
        // masterVolume * masterVolume (for quick calculations)
        _masterVolume = p.masterVolume * p.masterVolume,
        // Minimum frequency before stopping
        _minFreqency = p.minFrequency,
        // If the phaser is active
        _phaser = p.phaserOffset != 0 || p.phaserSweep != 0,
        // Change in phase offset
        _phaserDeltaOffset = p.phaserSweep * p.phaserSweep * p.phaserSweep * .2,
        // Phase offset for phaser effect
        _phaserOffset = p.phaserOffset * p.phaserOffset * (p.phaserOffset < 0 ? -1020 : 1020),
        // Once the time reaches this limit, some of the    iables are reset
        _repeatLimit = (p.repeatSpeed != 0) ? (((1 - p.repeatSpeed) * (1 - p.repeatSpeed) * 20000).toInt()) + 32 : 0,
        // The punch factor (louder at begining of sustain)
        _sustainPunch = p.sustainPunch,
        // Amount to change the period of the wave by at the peak of the vibrato wave
        _vibratoAmplitude = p.vibratoDepth / 2,
        // Speed at which the vibrato phase moves
        _vibratoSpeed = p.vibratoSpeed * p.vibratoSpeed * .01,
        // The type of wave to generate
        _waveType = p.waveType;

    var _envelopeLength      = _envelopeLength0,     // Length of the current envelope stage
        _envelopeOverLength0 = 1 / _envelopeLength0, // (for quick calculations)
        _envelopeOverLength1 = 1 / _envelopeLength1, // (for quick calculations)
        _envelopeOverLength2 = 1 / _envelopeLength2; // (for quick calculations)

    // Damping muliplier which restricts how fast the wave position can move
    var _lpFilterDamping = 5 / (1 + p.lpFilterResonance * p.lpFilterResonance * 20) * (.01 + _lpFilterCutoff);
    if (_lpFilterDamping > .8) {
      _lpFilterDamping = .8;
    }
    _lpFilterDamping = 1 - _lpFilterDamping;

    var _finished = false;     // If the sound has finished

    double
        _envelopeTime = 0.0,    // Current time through current enelope stage
        _envelopeVolume = 0.0,  // Current volume of the envelope
        _hpFilterPos = 0.0,     // Adjusted wave position after high-pass filter
        _lpFilterDeltaPos = 0.0,// Change in low-pass wave position, as allowed by the cutoff and damping
        _lpFilterOldPos = 0.0,  // Previous low-pass wave position
        _lpFilterPos = 0.0,     // Adjusted wave position after low-pass filter
        _pos = 0.0,             // Phase expresed as a Number from 0-1, used for fast sin approx
        _sample = 0.0,          // Sub-sample calculated 8 times per actual sample, averaged out to get the super sample
        _superSample = 0.0,     // Actual sample writen to the wave
        _periodTemp0 = 0.0,     // Period modified by vibrato
        _vibratoPhase = 0.0;    // Phase through the vibrato sine wave
    int
        _periodTemp = 0,        // Period modified by vibrato (as int)
        _phase = 0,             // Phase through the wave
        _envelopeStage = 0,     // Current stage of the envelope (attack, sustain, decay, end)
        _phaserPos = 0,         // Position through the phaser buffer
        _phaserInt = 0,         // Integer phaser offset, for bit maths
        _repeatTime = 0;        // Counter for the repeats

    var random = new math.Random();

    // Buffer of wave values used to create the out of phase second wave
    var _phaserBuffer = new List<double>(1024),
        // Buffer of random values used to generate noise
        _noiseBuffer  = new List<double>(32);

    for (var i = _phaserBuffer.length - 1 ; i > -1; i--) {
      _phaserBuffer[i] = 0.0;
    }

    for (var i = _noiseBuffer.length - 1 ; i > -1; i--) {
      _noiseBuffer[i] =  random.nextDouble() * 2 - 1;
    }

    for (var i = 0; i < length; i++) {
      if (_finished) {
        return true;
      }

      // Repeats every _repeatLimit times, partially resetting the sound parameters
      if (_repeatLimit != 0) {
        if (++_repeatTime >= _repeatLimit) {
          _repeatTime = 0;
          this.reset();
        }
      }

      // If _changeLimit is reached, shifts the pitch
      if (_changeLimit != 0) {
        if (++_changeTime >= _changeLimit) {
          _changeLimit = 0;
          _period *= _changeAmount;
        }
      }

      // Acccelerate and apply slide
      _slide += _deltaSlide;
      _period *= _slide;

      // Checks for frequency getting too low, and stops the sound if a minFrequency was set
      if (_period > _maxPeriod) {
        _period = _maxPeriod;
        if (_minFreqency > 0) {
          _finished = true;
        }
      }

      _periodTemp0 = _period;

      // Applies the vibrato effect
      if (_vibratoAmplitude > 0) {
        _vibratoPhase += _vibratoSpeed;
        _periodTemp0 *= 1 + math.sin(_vibratoPhase) * _vibratoAmplitude;
      }

      _periodTemp = _periodTemp0.toInt();
      if (_periodTemp < 8) {
        _periodTemp = 8;
      }

      // Sweeps the square duty
      if (_waveType == 0) {
        _squareDuty += _dutySweep;
        if (_squareDuty < 0) {
          _squareDuty = 0.0;
        } else if (_squareDuty > .5) {
          _squareDuty = .5;
        }
      }

      // Moves through the different stages of the volume envelope
      if (++_envelopeTime > _envelopeLength) {
        _envelopeTime = 0.0;

        switch (++_envelopeStage)  {
          case 1:
            _envelopeLength = _envelopeLength1;
            break;
          case 2:
            _envelopeLength = _envelopeLength2;
            break;
        }
      }

      // Sets the volume based on the position in the envelope
      switch (_envelopeStage) {
        case 0:
          _envelopeVolume = _envelopeTime * _envelopeOverLength0;
          break;
        case 1:
          _envelopeVolume = 1 + (1 - _envelopeTime * _envelopeOverLength1) * 2 * _sustainPunch;
          break;
        case 2:
          _envelopeVolume = 1 - _envelopeTime * _envelopeOverLength2;
          break;
        case 3:
          _envelopeVolume = 0.0;
          _finished = true;
          break;
      }

      // Moves the phaser offset
      if (_phaser) {
        _phaserOffset += _phaserDeltaOffset;
        _phaserInt = _phaserOffset.toInt();// | 0;
        if (_phaserInt < 0) {
          _phaserInt = -_phaserInt;
        } else if (_phaserInt > 1023) {
          _phaserInt = 1023;
        }
      }

      // Moves the high-pass filter cutoff
      if (_filters && _hpFilterDeltaCutoff != 0.0) {
        _hpFilterCutoff *= _hpFilterDeltaCutoff;
        if (_hpFilterCutoff < .00001) {
          _hpFilterCutoff = .00001;
        } else if (_hpFilterCutoff > .1) {
          _hpFilterCutoff = .1;
        }
      }

      _superSample = 0.0;
      for (var j = 0; j < 8; j++) {
        // Cycles through the period
        _phase++;
        if (_phase >= _periodTemp) {
          _phase %= _periodTemp;

          // Generates new random noise for this period
          if (_waveType == 3) {
            for (var n = _noiseBuffer.length - 1; n > -1; n-- ) {
              _noiseBuffer[n] = random.nextDouble() * 2 - 1;
            }
          }
        }

        // Gets the sample from the oscillator
        switch (_waveType) {
          case 0: // Square wave
            _sample = ((_phase / _periodTemp) < _squareDuty) ? .5 : -.5;
            break;
          case 1: // Saw wave
            _sample = 1 - (_phase / _periodTemp) * 2;
            break;
          case 2: // Sine wave (fast and accurate approx)
            _pos = _phase / _periodTemp;
            _pos = _pos > .5 ? (_pos - 1) * 6.28318531 : _pos * 6.28318531;
            _sample = _pos < 0 ? 1.27323954 * _pos + .405284735 * _pos * _pos : 1.27323954 * _pos - .405284735 * _pos * _pos;
            _sample = _sample < 0 ? .225 * (_sample *-_sample - _sample) + _sample : .225 * (_sample * _sample - _sample) + _sample;
            break;
          case 3: // Noise
            _sample = _noiseBuffer[(_phase * 32 / _periodTemp /*| 0*/).abs().toInt()];
            break;
        }

        // Applies the low and high pass filters
        if (_filters) {
          _lpFilterOldPos = _lpFilterPos;
          _lpFilterCutoff *= _lpFilterDeltaCutoff;
          if (_lpFilterCutoff < 0) {
            _lpFilterCutoff = 0;
          } else if (_lpFilterCutoff > .1) {
            _lpFilterCutoff = .1;
          }

          if (_lpFilterOn) {
            _lpFilterDeltaPos += (_sample - _lpFilterPos) * _lpFilterCutoff;
            _lpFilterDeltaPos *= _lpFilterDamping;
          } else {
            _lpFilterPos = _sample;
            _lpFilterDeltaPos = 0.0;
          }

          _lpFilterPos += _lpFilterDeltaPos;

          _hpFilterPos += _lpFilterPos - _lpFilterOldPos;
          _hpFilterPos *= 1 - _hpFilterCutoff;
          _sample = _hpFilterPos;
        }

        // Applies the phaser effect
        if (_phaser) {
          _phaserBuffer[_phaserPos % 1024] = _sample;
          _sample += _phaserBuffer[(_phaserPos - _phaserInt + 1024) % 1024];
          _phaserPos++;
        }

        _superSample += _sample;
      }

      // Averages out the super samples and applies volumes
      _superSample *= .125 * _envelopeVolume * _masterVolume;

      // Clipping if too loud [-1, 1]
      _superSample =_superSample >= 1 ? 1.0 : _superSample <= -1 ? -1.0 : _superSample; //* 32767 /*| 0*/;
      buffer[i] = _superSample;
    }

    return false;
  }

  static AudioBuffer toAudioBuffer(AudioContext audioContext, String data) {
    var synth = new SfxrSynth(new SfxrParams.fromString(data));
    var envelopeFullLength = synth.totalReset();
    var buffer = audioContext.createBuffer(2, envelopeFullLength, 44100);
    assert(envelopeFullLength <= buffer.length);
    synth.synthWave(buffer.getChannelData(0), envelopeFullLength);
    //var b = new Float32List(envelopeFullLength);
    //synth.synthWave(b, envelopeFullLength);
    //var buffer = audioContext.createBuffer(b.buffer, true);
    return buffer;
  }
}



