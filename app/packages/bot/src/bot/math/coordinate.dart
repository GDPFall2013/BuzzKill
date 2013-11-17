part of bot;

class Coordinate<T extends num> extends math.Point<T> {

  const Coordinate([T x = 0, T y = 0]) : super(x, y);

  /**
   * Computes the distance to another [Coordinate].
   *
   * Use [distanceTo] instead.
   **/
  @deprecated
  double getDistance (math.Point other) => distanceTo(other);

  bool get isValid => isValidNumber(x) && isValidNumber(y);

  /**
   * Subtract a [Coordinate] and returns the result as new [Vector].
   **/
  @override
  Vector<T> operator -(math.Point<T> other) => difference(this, other);

  @override
  Coordinate<T> operator +(math.Point<T> other) =>
      new Coordinate<T>(x + other.x, y + other.y);

  Vector toVector() => new Vector(x, y);

  Size toSize() => new Size(x, y);

  static Vector difference(math.Point a, math.Point b) =>
    new Vector(a.x - b.x, a.y - b.y);

  @deprecated
  dynamic toJson() => { 'x' : x, 'y' : y };
}
