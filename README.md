# About the Project

This repository was created as part of the "QA Mobile" course at Tinkoff Fintech, Spring 2023.

## Project Description

### Swift Inheritance Demo

The project demonstrates inheritance in Swift programming language using geometric shapes as an example. The code defines a base class `Shape` that represents a geometric shape. The class has two open methods `calculateArea()` and `calculatePerimeter()` that are designed to be overridden by child classes. The `Shape` class also adopts the `CustomStringConvertible` protocol, which allows the implementation of the `description` property that provides a string representation of the object and implements the `ShapeCalculatable` protocol. The code also includes three child classes: `Rectangle`, `Circle`, and `Square`. Each class inherits from the `Shape` class and implements its own calculation logic for area and perimeter by overriding the `calculateArea()` and `calculatePerimeter()` methods. Each child class also provides a string representation of the object by overriding the `description` property. The `ShapeCalculatable` protocol defines a method signature for calculating the area and perimeter of a collection of `Shape` objects. The `ShapeSumCalculator` class takes an array of `ShapeCalculatable` objects and provides methods to calculate the total area and perimeter of all the shapes in the array. It implements the `ShapeCalculatable` protocol and overrides the `description` property to provide a string representation of the calculator. 

## Requirements:

## Task

Design inheritance of geometric shapes as shown in the figure below. It is important to note that the `Shape` class is open for inheritance and has two functions available for overriding in the final classes of the figures `Rectangle`, `Circle`, and `Square`.

### How to do:

1. Create an open (available for inheritance) `Shape` class with two open methods, let the default methods call `fatalError("not implemented")`.

2. Describe the classes of concrete figures (`Rectangle`, `Circle`, `Square`), each class must have its own unique initializer and private variable to store values from the initializer. For example, for the `Circle` class, the initializer should take an argument of the radius with a type of `Double`, then the private variable will be the radius with a type of `Double`. Do the same for `Rectangle`, but with arguments of height and width, and for `Square`, define one side.

3. Inherit the `Rectangle`, `Circle`, `Square` classes from the base `Shape` class.

4. Override the `calculateArea()` and `calculatePerimeter()` methods inside the `Rectangle`, `Circle`, `Square` classes.

5. Implement the correct calculation of the perimeter and area for each of the classes (more information on the calculation formulas can be found on the Internet).

6. Implement an instance of any of the figures, calculate its perimeter and area using its methods.

7. *Implement an example where we can calculate the sum of the areas and the sum of the perimeters of different types of figures at the `Array<Shape>` array level.

8. To do this, create an array shapes: `[Shape]` and initialize it with different types of figures (let each one have one), also create counters for the total area and perimeter.

9. Go through the figures from the shapes array in a loop and calculate the total area and perimeter of the figures.

10. Print our area and perimeter counters to the console.

## Project Team

- Oleg Komissarov - QA Engineer

## Swift:

- Swift version 5.7