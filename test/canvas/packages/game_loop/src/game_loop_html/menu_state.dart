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

typedef void MenuStateSelectedFunction();

class MenuOption {
  String text;
  MenuStateSelectedFunction onSelected;

  MenuOption(this.text, this.onSelected);
}

abstract class MenuState extends GameLoopHtmlState {
  List<MenuOption> options;
  int selected;

  MenuState(this.options, [ this.selected = 0 ]);

  _selectPrev() {
    selected = selected - 1;
    if (selected < 0) {
      selected = options.length - 1;
    }
  }

  _selectNext() {
    selected = selected + 1;
    if (selected >= options.length){
      selected = 0;
    }
  }

  _selectOption() {
    options[selected].onSelected();
  }

  void onKeyDown(KeyboardEvent event) {
    event.preventDefault();

    switch (event.which) {
      case Keyboard.DOWN:
      case Keyboard.J:
        _selectNext();
        break;

      case Keyboard.UP:
      case Keyboard.K:
        _selectPrev();
        break;

      case Keyboard.ENTER:
      case Keyboard.SPACE:
        _selectOption();
        break;
    }
  }
}