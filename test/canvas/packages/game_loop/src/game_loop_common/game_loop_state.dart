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

part of game_loop_common;

/** Collects together a set of `GameLoop` handlers into a single object.
 *
 * This is very useful if your game switches back and forth between sets of
 * handlers (such as switching from an intro, menu, or gameplay state.)
 *
 * Use `GameLoop.state` property to set the games current state:
 *
 *     state = new ColorState("rgba(255, 0, 0, 0)");
 *     gameLoop.state = state;
 *
 * To create your own state, extend `GameLoopState` or `GameLoopHtmlState` and
 * implement each of the states handlers.
 *
 *     class ColorState extends GameLoopHtmlState {
 *         String backgroundColor;
 *
 *         ColorState(this.backgroundColor);
 *
 *         onRender(GameLoop gameLoop) {
 *           // SNIP! RENDER THE STATE HERE...
 *         }
 *
 *         // SNIP! UNUSED HANDLERS REMOVED FOR CLARITY...
 *     }
 *
 * For examples look at `MenuState` or look in the /examples folder of this
 * package.
 *
 * Developers who are already familiar with each of the `GameLoop` handlers and
 * wish to write more concise code, may find `SimpleState` and `SimpleHtmlState`
 * handy. These provide simple no-op implementations of each of the `GameLoop`
 * handlers, and only require you to override the handlers you're interested in.
 */
abstract class GameLoopState {
  void onUpdate(GameLoop gameLoop);
}