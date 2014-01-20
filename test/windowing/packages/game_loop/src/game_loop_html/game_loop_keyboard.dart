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

/** A keyboard input. Has digital buttons corresponding to keyboard keys.
 *  Contains the same constants as the [KeyCode] class.
 */
class Keyboard extends DigitalInput {
  /** The A key. */
  static const A = KeyCode.A;
  /** The B key. */
  static const B = KeyCode.B;
  /** The C key. */
  static const C = KeyCode.C;
  /** The D key. */
  static const D = KeyCode.D;
  /** The E key. */
  static const E = KeyCode.E;
  /** The F key. */
  static const F = KeyCode.F;
  /** The G key. */
  static const G = KeyCode.G;
  /** The H key. */
  static const H = KeyCode.H;
  /** The I key. */
  static const I = KeyCode.I;
  /** The J key. */
  static const J = KeyCode.J;
  /** The K key. */
  static const K = KeyCode.K;
  /** The L key. */
  static const L = KeyCode.L;
  /** The M key. */
  static const M = KeyCode.M;
  /** The N key. */
  static const N = KeyCode.N;
  /** The O key. */
  static const O = KeyCode.O;
  /** The P key. */
  static const P = KeyCode.P;
  /** The Q key. */
  static const Q = KeyCode.Q;
  /** The R key. */
  static const R = KeyCode.R;
  /** The S key. */
  static const S = KeyCode.S;
  /** The T key. */
  static const T = KeyCode.T;
  /** The U key. */
  static const U = KeyCode.U;
  /** The V key. */
  static const V = KeyCode.V;
  /** The W key. */
  static const W = KeyCode.W;
  /** The X key. */
  static const X = KeyCode.X;
  /** The Y key. */
  static const Y = KeyCode.Y;
  /** The Z key. */
  static const Z = KeyCode.Z;
  /** The Shift key. */
  static const SHIFT = KeyCode.SHIFT;
  /** The Control key. */
  static const CTRL = KeyCode.CTRL;
  /** The Alt key. */
  static const ALT = KeyCode.ALT;
  /** The Space key. */
  static const SPACE = KeyCode.SPACE;
  /** The Zero key. */
  static const ZERO = KeyCode.ZERO;
  /** The One key. */
  static const ONE = KeyCode.ONE;
  /** The Two key. */
  static const TWO = KeyCode.TWO;
  /** The Three key. */
  static const THREE = KeyCode.THREE;
  /** The Four key. */
  static const FOUR = KeyCode.FOUR;
  /** The Five key. */
  static const FIVE = KeyCode.FIVE;
  /** The Six key. */
  static const SIX = KeyCode.SIX;
  /** The Seven key. */
  static const SEVEN = KeyCode.SEVEN;
  /** The Eight key. */
  static const EIGHT = KeyCode.EIGHT;
  /** The Nine key. */
  static const NINE = KeyCode.NINE;
  /** The Enter key. */
  static const ENTER = KeyCode.ENTER;
  /** The Up key. */
  static const UP = KeyCode.UP;
  /** The Down key. */
  static const DOWN = KeyCode.DOWN;
  /** The Left key. */
  static const LEFT = KeyCode.LEFT;
  /** The Right key. */
  static const RIGHT = KeyCode.RIGHT;
  /** The Escape key. */
  static const ESCAPE = KeyCode.ESC;
  /** The Apostrophe key. CAUTION: This constant requires localization for other
   * locales and keyboard layouts. */
  static const APOSTROPHE = KeyCode.APOSTROPHE;
  /** The Backslash key. CAUTION: This constant requires localization for other
   * locales and keyboard layouts. */
  static const BACKSLASH = KeyCode.BACKSLASH;
  /** The Backspace key. */
  static const BACKSPACE = KeyCode.BACKSPACE;
  /** The Caps Lock key. */
  static const CAPS_LOCK = KeyCode.CAPS_LOCK;
  /** The Close Square Bracket key. CAUTION: This constant requires localization
   * for other locales and keyboard layouts. */
  static const CLOSE_SQUARE_BRACKET = KeyCode.CLOSE_SQUARE_BRACKET;
  /** The Comma key. CAUTION: This constant requires localization for other
   * locales and keyboard layouts. */
  static const COMMA = KeyCode.COMMA;
  /** The Context Menu key. */
  static const CONTEXT_MENU = KeyCode.CONTEXT_MENU;
  /** The Dash key. CAUTION: This constant requires localization for other
   * locales and keyboard layouts. */
  static const DASH = KeyCode.DASH;
  /** The Delete key. */
  static const DELETE = KeyCode.DELETE;
  /** The End key. */
  static const END = KeyCode.END;
  /** The Equals key. CAUTION: This constant requires localization for other
   * locales and keyboard layouts. */
  static const EQUALS = KeyCode.EQUALS;
  /** The F1 key. */
  static const F1 = KeyCode.F1;
  /** The F2 key. */
  static const F2 = KeyCode.F2;
  /** The F3 key. */
  static const F3 = KeyCode.F3;
  /** The F4 key. */
  static const F4 = KeyCode.F4;
  /** The F5 key. */
  static const F5 = KeyCode.F5;
  /** The F6 key. */
  static const F6 = KeyCode.F6;
  /** The F7 key. */
  static const F7 = KeyCode.F7;
  /** The F8 key. */
  static const F8 = KeyCode.F8;
  /** The F9 key. */
  static const F9 = KeyCode.F9;
  /** The F10 key. */
  static const F10 = KeyCode.F10;
  /** The F11 key. */
  static const F11 = KeyCode.F11;
  /** The F12 key. */
  static const F12 = KeyCode.F12;
  /** The FF Equals key. */
  static const FF_EQUALS = KeyCode.FF_EQUALS;
  /** The FF Semicolon key. */
  static const FF_SEMICOLON = KeyCode.FF_SEMICOLON;
  /** The First Media key. */
  static const FIRST_MEDIA_KEY = KeyCode.FIRST_MEDIA_KEY;
  /** The Home key. */
  static const HOME = KeyCode.HOME;
  /** The Insert key. */
  static const INSERT = KeyCode.INSERT;
  /** The Last Media key. */
  static const LAST_MEDIA_KEY = KeyCode.LAST_MEDIA_KEY;
  /** The Mac Enter key. */
  static const MAC_ENTER = KeyCode.MAC_ENTER;
  /** The Mac FF Meta key. */
  static const MAC_FF_META = KeyCode.MAC_FF_META;
  /** The Meta key. */
  static const META = KeyCode.META;
  /** The Num Center key. */
  static const NUM_CENTER = KeyCode.NUM_CENTER;
  /** The Num Delete key. */
  static const NUM_DELETE = KeyCode.NUM_DELETE;
  /** The Num Division key. */
  static const NUM_DIVISION = KeyCode.NUM_DIVISION;
  /** The Num East key. */
  static const NUM_EAST = KeyCode.NUM_EAST;
  /** The Num Eight key. */
  static const NUM_EIGHT = KeyCode.NUM_EIGHT;
  /** The Num Five key. */
  static const NUM_FIVE = KeyCode.NUM_FIVE;
  /** The Num Four key. */
  static const NUM_FOUR = KeyCode.NUM_FOUR;
  /** The Num Insert key. */
  static const NUM_INSERT = KeyCode.NUM_INSERT;
  /** The Num Minus key. */
  static const NUM_MINUS = KeyCode.NUM_MINUS;
  /** The Num Multiply key. */
  static const NUM_MULTIPLY = KeyCode.NUM_MULTIPLY;
  /** The Num Nine key. */
  static const NUM_NINE = KeyCode.NUM_NINE;
  /** The Num North key. */
  static const NUM_NORTH = KeyCode.NUM_NORTH;
  /** The Num North East key. */
  static const NUM_NORTH_EAST = KeyCode.NUM_NORTH_EAST;
  /** The Num North West key. */
  static const NUM_NORTH_WEST = KeyCode.NUM_NORTH_WEST;
  /** The Num One key. */
  static const NUM_ONE = KeyCode.NUM_ONE;
  /** The Num Period key. */
  static const NUM_PERIOD = KeyCode.NUM_PERIOD;
  /** The Num Plus key. */
  static const NUM_PLUS = KeyCode.NUM_PLUS;
  /** The Num Seven key. */
  static const NUM_SEVEN = KeyCode.NUM_SEVEN;
  /** The Num Six key. */
  static const NUM_SIX = KeyCode.NUM_SIX;
  /** The Num South key. */
  static const NUM_SOUTH = KeyCode.NUM_SOUTH;
  /** The Num South East key. */
  static const NUM_SOUTH_EAST = KeyCode.NUM_SOUTH_EAST;
  /** The Num South West key. */
  static const NUM_SOUTH_WEST = KeyCode.NUM_SOUTH_WEST;
  /** The Num Three key. */
  static const NUM_THREE = KeyCode.NUM_THREE;
  /** The Num Two key. */
  static const NUM_TWO = KeyCode.NUM_TWO;
  /** The Num West key. */
  static const NUM_WEST = KeyCode.NUM_WEST;
  /** The Num Zero key. */
  static const NUM_ZERO = KeyCode.NUM_ZERO;
  /** The Num Lock key. */
  static const NUMLOCK = KeyCode.NUMLOCK;
  /** The Open Square Bracket key. CAUTION: This constant requires localization
   * for other locales and keyboard layouts. */
  static const OPEN_SQUARE_BRACKET = KeyCode.OPEN_SQUARE_BRACKET;
  /** The Page up key. */
  static const PAGE_UP = KeyCode.PAGE_UP;
  /** The Page down key. */
  static const PAGE_DOWN = KeyCode.PAGE_DOWN;
  /** The Pause key. */
  static const PAUSE = KeyCode.PAUSE;
  /** The Period key. CAUTION: This constant requires localization for other
   * locales and keyboard layouts. */
  static const PERIOD = KeyCode.PERIOD;
  /** The Print Screen key. */
  static const PRINT_SCREEN = KeyCode.PRINT_SCREEN;
  /** The Question Mark key. CAUTION: This constant requires localization for
   * other locales and keyboard layouts.*/
  static const QUESTION_MARK = KeyCode.QUESTION_MARK;
  /** The Scroll Lock key. */
  static const SCROLL_LOCK = KeyCode.SCROLL_LOCK;
  /** The Semicolon key. CAUTION: This constant requires localization for other
   * locales and keyboard layouts. */
  static const SEMICOLON = KeyCode.SEMICOLON;
  /** The Single Quote key. CAUTION: This constant requires localization for
   * other locales and keyboard layouts.*/
  static const SINGLE_QUOTE = KeyCode.SINGLE_QUOTE;
  /** The Slash key. CAUTION: This constant requires localization for other
   * locales and keyboard layouts.*/
  static const SLASH = KeyCode.SLASH;
  /** The Tab key. */
  static const TAB = KeyCode.TAB;
  /** The Tilde key. CAUTION: This constant requires localization for other
   * locales and keyboard layouts. */
  static const TILDE = KeyCode.TILDE;
  /** The Win IME key. */
  static const WIN_IME = KeyCode.WIN_IME;
  /** The Win key. */
  static const WIN_KEY = KeyCode.WIN_KEY;
  /** The Win FF Linux key. */
  static const WIN_KEY_FF_LINUX = KeyCode.WIN_KEY_FF_LINUX;
  /** The Win Left key. */
  static const WIN_KEY_LEFT = KeyCode.WIN_KEY_LEFT;
  /** The Win Right key. */
  static const WIN_KEY_RIGHT = KeyCode.WIN_KEY_RIGHT;
  static final List<int> _buttonIds = [A, B, C,
                               D, E, F,
                               G, H, I,
                               J, K, L,
                               M, N, O,
                               P, Q, R,
                               S, T, U,
                               V, W, X,
                               Y, Z,
                               SHIFT,
                               CTRL,
                               ALT,
                               SPACE,
                               ZERO,
                               ONE,
                               TWO,
                               THREE,
                               FOUR,
                               FIVE,
                               SIX,
                               SEVEN,
                               EIGHT,
                               NINE,
                               ENTER,
                               UP,
                               DOWN,
                               LEFT,
                               RIGHT,
                               ESCAPE,
                               APOSTROPHE,
                               BACKSLASH,
                               BACKSPACE,
                               CAPS_LOCK,
                               CLOSE_SQUARE_BRACKET,
                               COMMA,
                               CONTEXT_MENU,
                               DASH,
                               DELETE,
                               END,
                               EQUALS,
                               F1, F2, F3,
                               F4, F5, F6,
                               F7, F8, F9,
                               F10, F11, F12,
                               FF_EQUALS,
                               FF_SEMICOLON,
                               FIRST_MEDIA_KEY,
                               HOME,
                               INSERT,
                               LAST_MEDIA_KEY,
                               MAC_ENTER,
                               MAC_FF_META,
                               META,
                               NUM_CENTER,
                               NUM_DELETE,
                               NUM_DIVISION,
                               NUM_EAST,
                               NUM_EIGHT,
                               NUM_FIVE,
                               NUM_FOUR,
                               NUM_INSERT,
                               NUM_MINUS,
                               NUM_MULTIPLY,
                               NUM_NINE,
                               NUM_NORTH,
                               NUM_NORTH_EAST,
                               NUM_NORTH_WEST,
                               NUM_ONE,
                               NUM_PERIOD,
                               NUM_PLUS,
                               NUM_SEVEN,
                               NUM_SIX,
                               NUM_SOUTH,
                               NUM_SOUTH_EAST,
                               NUM_SOUTH_WEST,
                               NUM_THREE,
                               NUM_TWO,
                               NUM_WEST,
                               NUM_ZERO,
                               NUMLOCK,
                               OPEN_SQUARE_BRACKET,
                               PAGE_UP,
                               PAGE_DOWN,
                               PAUSE,
                               PERIOD,
                               PRINT_SCREEN,
                               QUESTION_MARK,
                               SCROLL_LOCK,
                               SEMICOLON,
                               SINGLE_QUOTE,
                               SLASH,
                               TAB,
                               TILDE,
                               WIN_IME,
                               WIN_KEY,
                               WIN_KEY_FF_LINUX,
                               WIN_KEY_LEFT,
                               WIN_KEY_RIGHT
                               ];

  Keyboard(gameLoop) : super(gameLoop, _buttonIds);
}