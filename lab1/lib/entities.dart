class Figure {
  String name;

  Figure(this.name);
}

class Point extends Figure {
  int x, y;

  Point(String name, this.x, this.y) : super(name);

  Point.standart() : super('default') {
    x = 10;
    y = 10;
  }

  void printPoint() {
    print('X: ${this.x}, Y: ${this.y}');
  }
}

class Circle extends Figure {
  Point center;
  int radius;

  Circle(String name, this.center, this.radius) : super(name);

  void printCircle() {
    print('Radius: ${this.radius}');
    print('Center: ');
    this.center.printPoint();
  }

  double getArea() {
    return 3.14 * this.radius * this.radius;
  }
}
