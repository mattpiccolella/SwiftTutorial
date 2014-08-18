import UIKit

// Introduction to Swift
// From "The Swift Programming Language"
// Notes taken by Matthew Piccolella (mjp2220)

// Variables use var, constants use let
var str = "Hello, playground"
let myString = "Yes!"

// Print same as Java, but no semi-colons
println("Hello World!")

// Specify type, when it's not inferred, cast using parentheses
let explicitDouble: Double = 70
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
let apples = 3
let appleSummary = "I have \(apples) apples"

// Dictionaries can be instantiated with values or specified by type
var dict = [
    "Malcolm": "X",
    "Martin Luther": "King"
]
var dict1 = Dictionary<String, String>()
dict1["matt"] = "Public Relations"
println(dict["Malcolm"])

// For loops can be iterated through easily
for score in [75, 45, 89, 90] {
    println(score)
}

// Better logic in switch statements with types other than integers
let vegetable = "red pepper"
switch vegetable {
    case "celery":
        let vegetableComment = "Add some raisins and make ants on a log"
    case "cucumber", "watercress":
        let vegetableComment = "That would make a good tea sandwich."
    case let x where x.hasSuffix("pepper"):
        let vegetableComment = "Is it a spicy \(x)?"
    default:
        let vegetableComment = "Everything tastes good in soup."
}

// Iterate through dictionaries easily
for (firstName, lastName) in dict {
    println("Hello \(firstName) \(lastName)")
}

// Use ranges in for loops, .. doesn't include upper range, ... does
var firstForLoop = 0
for i in 0...3 {
    firstForLoop += i
}
println(firstForLoop)

// func declares function, arguments include name and type, return after arrow
func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
greet("Bob", "Tuesday")

// Use tuples to return multiple values from a function
func getGasPrices() -> (Double, Double, Double) {
    return (3.59, 3.69, 3.79)
}
getGasPrices()

// Can also take arbitrary number of arguments, treated as array
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(54, 65, 705)

func average(numbers: Int...) -> Double {
    var sum = 0
    var count = 0
    for number in numbers {
        sum += number
        count += 1
    }
    var average: Double
    average = Double(sum) / Double(count)
    return average
}
average(4,5,6)

// Nested functions can lead to better organization
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// Functions are first class, return them!
func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var incrementer = makeIncrementer()
incrementer(7)

func makeGreeter() -> (String -> String) {
    func greeter(name: String) -> String {
        return "Hello \(name)"
    }
    return greeter
}
var greeter = makeGreeter()
greeter("Matt")

// We can also pass them as arguments
func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [ 20, 19, 7, 12]
hasAnyMatches(numbers, lessThanTen)

// Closures are great, nameless functions, separate arguments with "in"
var sum = numbers.map({
    (number: Int) -> Int in
    if number % 2 == 0 {
        return number * 2
    } else {
        return 0
    }
})
println(sum)

// Also closures can be done concisely, refer to arguments
numbers.map({number in 3 * number })
sort([1,2,3,4]) { return $0 > $1 }

// class is used to create a class
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

// We need an initializer i.e. constructor, deinit is destructor
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// Inheritance names subclass and overrides
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "My Test Square")
test.area()
test.simpleDescription()

// Properties make it easier to have getters and setters
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return sideLength * 3
        }
        // Has implict name newValue, can also explicitly state one
        set {
            sideLength = newValue / 3.0
        }
    }
}

// Can also add willSet and didSet to run code before and after setting
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another shape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength: 50, name:"larger square")
triangleAndSquare.triangle.sideLength

// Methods on classes can have a different name used inside the function
class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times: Int) {
        count += amount * times
    }
}
var counter = Counter()
counter.incrementBy(2, numberOfTimes: 8)

// ? means optional, if the value before ? is nil, everything after it is ignored
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

// Enumerations (enum) can have methods
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.toRaw())
        }
    }
}

// Only specify the first raw value, rest are assigned in order
let ace = Rank.Ace
let aceRawValue = ace.toRaw()
let convertedRank = Rank.fromRaw(3)
println(convertedRank)

// Structure (struct) are copied when they are passed in code
struct Card {
    var rank: Rank
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription())"
    }
}
let three = Card(rank: Rank.Ace)

// Instances of enumeration member types can have different values
// Associated values are provided when we create the instance
enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00am", "8:09pm")
let failure = ServerResponse.Error("Out of Cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure... \(error)"
}

// Protocol is kind-of like an interface
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "a simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// Enumerations can also conform to protocols!
enum SimpleEnum: ExampleProtocol {
    case Base, Adjusted
    
    var simpleDescription: String {
        get {
            return self.getDescription()
        }
    }
    
    func getDescription() -> String {
        switch self {
        case .Base:
            return "Simple basic enum"
        case .Adjusted:
            return "Simple adjusted enum"
        default:
            return "Default enum"
        }
    }
    
    mutating func adjust() -> Void {
        self = SimpleEnum.Adjusted
    }
}

// Extensions allow you to add functionality to an existing type or conform
// existing types to protocols
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
9.simpleDescription

// You can use a protocol name just like other types
let protocolValue: ExampleProtocol = a
protocolValue.simpleDescription

// Generics are also available using angle brackets
func repeat<ItemType>(item: ItemType, times: Int) -> [ItemType] {
    var result = [ItemType]()
    for i in 0...times {
        result += i
    }
    return result
}
repeat("knock", 4)

enum OptionalValue<T> {
    case None
    case Some(T)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

// You can specify conditions for generics
func anyCommonElements <T, U where T: SequenceType, U: SequenceType,
        T.GeneratorType.Element: Equatable,
        T.GeneratorType.Element == U.GeneratorType.Element> (lhs:
        T, rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1,2,3], [3])
