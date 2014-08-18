import UIKit

// Basic Operators and Strings
// From "The Swift Programming Language"
// Notes taken by Matthew Piccolella (mjp2220)

// Assignment operator
let b = 10
var a = 5
a = b

// Assignment with tuples
let (x, y) = (1, 2)

// Assignment doesn't return
if x = y {
    // NOT VALID
}

// Arithmetic
1 + 2
5 - 3
2 * 3
10.0 / 2.5

// String concatenation
"hello, " + "world"
let dog: Character = "D"
let cat: Character = "C"
let dogCat = dog + cat

// Remainder
9 % 4
-9 % 4
8 % 2.5

// Increment and Decrement
var i = 0
++i; i++
--i; i--

// Unary Minus and Plus
let three = 3
let minusThree = -three
let plusThree = -minusThree
let minusSix = -6
let alsoMinusSix = +minusSix

// Compound Assignment
var c = 1
c += 2

// Comparison
1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

// Ternary Conditional Operator
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

// Range Operators
for index in 1...5 {
    // Closed range
}
for index in 1..5 {
    // Half-closed range
}

// Logical Operators
// NOT
let allowedEntry = false
!allowedEntry

// AND
let enteredDoorCode = true
let passedRetinaScan = false
let isWelcome = enteredDoorCode && passedRetinaScan

// OR
let hasDoorKey = false
let knowsOverridePassword = true
let canEnter = hasDoorKey || knowsOverridePassword

// String Literal
let someString = "Some string literal value"
let wiseWords = "\"Imagination is more important than knowledge\""

// Empty String
var emptyString = ""
var anotherEmptyString = String()
emptyString.isEmpty

// Mutability
var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
constantString += " and another Highlander" // ILLEGAL

// Pulling characters out
for character in "Dog!" {
    println(character)
}

// countElements can be used to count how many characters
let sampleString = "Matt is really cool."
println("Sample string has \(countElements(sampleString)) characters")

// String interpolation allows us to make new strings given other kinds
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

// String equality uses normal equals operator
if "Spork" == "Spork" {
    println("Spork!")
}

// Prefix and Suffix
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's Mansion"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        ++act1SceneCount
    }
}

if romeoAndJuliet[0].hasSuffix("Capulet's Mansion") {
    println("We got the scene!")
}

// Upper and lower case
let normal = "Could you help me, please?"
let shouty = normal.uppercaseString
let whispered = normal.lowercaseString






