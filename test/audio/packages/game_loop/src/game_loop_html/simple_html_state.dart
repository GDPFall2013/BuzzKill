/*
  Copyright (C) 2013 John McCutchan <john@johnmccutchan.com>

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

part of game_loop_html;

/**
 * SimpleState provides default implementations of all the common handlers
 * which you can then override with your own implementations.
 *
 * Look at the documentation for `GameLoopHtmlState` for a description of each
 * handler.
 */
class SimpleHtmlState extends GameLoopHtmlState {

  /**
   * Calling this handler has no affect. Override this handler to implement
   * your behaviour.
   */
  void onFullScreenChange(GameLoop gameLoop) { }

  /**
   * Calling this handler has no affect. Override this handler to implement
   * your behaviour.
   */
  void onKeyDown(KeyboardEvent event) { }

  /**
   * Calling this handler has no affect. Override this handler to implement
   * your behaviour.
   */
  void onPointerLockChange(GameLoop gameLoop) { }

  /**
   * Calling this handler has no affect. Override this handler to implement
   * your behaviour.
   */
  void onRender(GameLoop gameLoop) { }

  /**
   * Calling this handler has no affect. Override this handler to implement
   * your behaviour.
   */
  void onResize(GameLoop gameLoop) { }

  /**
   * Calling this handler has no affect. Override this handler to implement
   * your behaviour.
   */
  void onTouchEnd(GameLoop gameLoop, GameLoopTouch touch) { }

  /**
   * Calling this handler has no affect. Override this handler to implement
   * your behaviour.
   */
  void onTouchStart(GameLoop gameLoop, GameLoopTouch touch) { }

  /**
   * Calling this handler has no affect. Override this handler to implement
   * your behaviour.
   */
  void onUpdate(GameLoop gameLoop) { }
}