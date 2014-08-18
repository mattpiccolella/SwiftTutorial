import UIKit

// The Basics
// From "The Swift Programming Language"
// Notes taken by Matthew Piccolella (mjp2220)

/*
 * Swift has Int, UInt, Double, Float, Bool, String
 * Array and Dictionary are collection types
 * Tuples and optionals have also been added
 */
var integer: Int
var unsignedInteger: UInt
var double: Double
var boolean: Bool
var string: String

// Type checks are performed on compile, type inference is used
let meaningOfLife = 42 // inferred to be Int
let pi = 3.14159 // inferred to be Double

// We can use other bases too
let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

// Can add padding, formatting, etc., to add with readability
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

// Casting is done with casts
let three = 3
let pointOneFourOneFiveNine = 0.14159
let roundedPi = Double(three) + pointOneFourOneFiveNine

// Set alias for types
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

// Tuples group values together
let http404Error = (404, "Not Found") // (Int, String)
let (statusCode, statusMessage) = http404Error
println("Status code: \(statusCode)")
println("Status message: \(statusCode)")

// Ignore certain parts using underscore
let (justStatusCode, _) = http404Error

// Access by index
println("Status code: \(statusCode.0)")

// Or name the elements
let http200Status = (statusCode: 200, description: "OK")

// Optionals either have a value or they don't
let possibleNumber = "123"
let convertedNumber = possibleNumber.toInt() // Int?, optional Int
if convertedNumber != nil {
    println("\(possibleNumber) has a value of \(convertedNumber!)")
} else {
    println("\(possibleNumber) does not have a value")
}

// Optional binding allows us to check for value inside optional
if let actualNumber = possibleNumber.toInt() {
    println("\(possibleNumber) has an integer value of \(actualNumber)")
} else {
    println("\(possibleNumber) could not be converted to an integer")
}

// nil represents valueless state, only available in optional
var serverResponseCode: Int? = 404
serverResponseCode = nil

// Implicitly unwrapped optionals are when value is confirmed to exist
// immediately after the optional is defined
let possibleString: String? = "An optional string."
println(possibleString!)

let assumedString: String! = "An implicitly unwrapped optional string."
println(assumedString)

// Assertions can be used to end code execution and provide debug opportunity
let age = 3
assert(age >= 0, "A person's age cannot be less than zero")
