import Foundation

/// Протокол для рассчета периметра и площади фигуры.
protocol ShapeCalculatable {
  func calculatePerimeter() -> Double
  func calculateArea() -> Double
}

/// Класс, представляющий базовую фигуру.
class Shape: ShapeCalculatable, CustomStringConvertible {

  /**
Расчитывает площадь фигуры и возвращает результат.

- Returns: Площадь фигуры
*/
  func calculateArea() -> Double {
    fatalError("not implemented")
  }

  /**
Расчитывает периметр фигуры и возвращает результат.

- Returns: Периметр фигуры
*/
  func calculatePerimeter() -> Double {
    fatalError("not implemented")
  }

  /**
Строковое представление фигуры.

- Returns: Строковое представление фигуры
*/
  var description: String {
    return "\(type(of: self))"
  }
}

/// Класс, представляющий прямоугольник, наследующий базовый класс Shape.
class Rectangle: Shape {
  let height: Double
  let width: Double
  init(_ height: Double?, _ width: Double?) {
    self.height = height ?? 0.0
    self.width = width ?? 0.0
  }

  /**
Расчитывает площадь прямоугольника и возвращает результат.

- Returns: Площадь прямоугольника
*/
  override func calculateArea() -> Double {
    return self.height * self.width
  }

  /**
Расчитывает периметр прямоугольника и возвращает результат.

- Returns: Периметр прямоугольника
*/
  override func calculatePerimeter() -> Double {
    return (self.height + self.width) * 2
  }

  /**
Строковое представление прямоугольника.

- Returns: Строковое представление прямоугольника
*/
  override var description: String {
    return "\(super.description) with height = \(self.height) and width = \(self.width)"
  }
}

/// Класс, представляющий круг, наследующий базовый класс Shape.
class Circle: Shape {
  let radius: Double
  init(_ radius: Double?) {
    self.radius = radius ?? 0.0
  }

  /**
Расчитывает площадь круга и возвращает результат.

- Returns: Площадь круга
*/
  override func calculateArea() -> Double {
    return Double.pi * self.radius * self.radius
  }

  /**
Расчитывает периметр круга и возвращает результат.

- Returns: Периметр круга
*/
  override func calculatePerimeter() -> Double {
    return 2 * Double.pi * self.radius
  }

  /**
Строковое представление круга.

- Returns: Строковое представление круга
*/
  override var description: String {
    return "\(super.description) with radius = \(self.radius)"
  }
}

/// Класс, представляющий квадрат, наследующий базовый класс Shape.
class Square: Shape {
  let side: Double
  init(_ side: Double?) {
    self.side = side ?? 0.0
  }

  /**
Расчитывает площадь квадрата и возвращает результат.

- Returns: Площадь квадрата
*/
  override func calculateArea() -> Double {
    return self.side * self.side
  }

  /**
Расчитывает периметр квадрата и возвращает результат.

- Returns: Периметр квадрата
*/
  override func calculatePerimeter() -> Double {
    return 4 * self.side
  }

  /**
Строковое представление круга.

- Returns: Строковое представление квадрата
*/
  override var description: String {
    return "\(super.description) with side = \(self.side)"
  }
}

/// Класс, представляющий калькулятор для вычисления площади и периметра фигур
class ShapeSumCalculator: ShapeCalculatable, CustomStringConvertible {
  var totalArea: Double?
  var totalPerimeter: Double?
  //Массив фигур
  let shapes: [ShapeCalculatable]
  init(_ shapes: [ShapeCalculatable]) {
    self.shapes = shapes
  }

  /**
    Функция, вычисляющая суммарную площадь фигур

    - Returns: Суммарная площадь фигур
*/
  func calculateArea() -> Double {
    self.totalArea = self.shapes.reduce(0.0) { $0 + $1.calculateArea() }
    return self.totalArea ?? 0.0
  }

  /**
    Функция, вычисляющая суммарный периметр фигур

    - Returns: Суммарный периметр фигур
*/
  func calculatePerimeter() -> Double {
    self.totalPerimeter = self.shapes.reduce(0.0) { $0 + $1.calculatePerimeter() }
    return self.totalPerimeter ?? 0.0
  }

  /**
    Возвращает строковое представление массива фигур для вычисления площади и периметра фигур.
    
    - Returns: Строковое представление калькулятора.
    */
  var description: String {
    let descriptions = self.shapes.map {"\($0)"}
    return descriptions.joined(separator: ", ")
  }

}

/**
 Возвращает отформатированное строковое значение для объекта фигуры в зависимости от типа вычисления и заданной точности.

 - Parameters:
    - object: Объект
    - operationType: Тип вычисления
    - precision: Точность (количество знаков после запятой)

 - Returns: Отформатированное строковое значение для объекта фигуры.
 */
func getFormattedValue(for object: ShapeCalculatable, operationType: OperationType, _ precision: Int = 2) -> String {
let description: String
let value: Double
switch operationType {
    case let .area(desc):
        value = object.calculateArea()
        description = desc
    case let .perimeter(desc):
        value = object.calculatePerimeter()
        description = desc
    }
      return ("\(object) - \(description): \(String(format: "%.\(precision)f", value))")
    }

/// Перечисление, определяющее тип вычисления
enum OperationType {
    /// Вычисление площади.
    case area(description: String)
    /// Вычисление периметра.
    case perimeter(description: String)
}

let rectangle = Rectangle(2, 3)
let circle = Circle(2)
let square = Square(4)
let shapes: [ShapeCalculatable] = [square, rectangle, circle]
let shapeCalculator: ShapeCalculatable = ShapeSumCalculator(shapes)
print("\(rectangle) - \(String(format: "Perimeter: %.2f", rectangle.calculatePerimeter())), \(String(format: "Area: %.2f", rectangle.calculateArea()))")
print(getFormattedValue(for: rectangle, operationType: .area(description: "Area")))
print(getFormattedValue(for: shapeCalculator, operationType: .area(description: "Total area")))
print(getFormattedValue(for: rectangle, operationType: .perimeter(description: "Perimeter")))
print(getFormattedValue(for: shapeCalculator, operationType: .perimeter(description: "Total perimeter")))

