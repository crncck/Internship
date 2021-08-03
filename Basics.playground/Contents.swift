import UIKit


// 1 - Variables

var favoriteShow = "Blacklist"      // var => mutable
favoriteShow = "Doctor Who"
print(favoriteShow)

// Type Inference

var number: String                  // explicitly
var street: String = "5th Avenue"   // implicitly

// Changing Type

street = "Main Street"
number = "10"                       // number = 10 (error)






// 2 - Constants

let favoriteBook = "Martin Eden"   // let (constant) => immutable
print(favoriteBook)





// 3 - Data Types => Int, Float, Double, String, Character, Bool
// 3.1 Booleans
var  bool1 : Bool
bool1 = true
print(type(of: bool1))

var number1 = 3.2
var number2 = 4.3
var result = number1 > number2      // false


var gender = true

// Ternary Conditional Operator
print(gender == true ? "Girl" : "Boy")


let bool2 : Bool = Bool(truncating: 0)
let bool3 = Bool(truncating: 20)
print(bool2)
let number3 = NSNumber(value: bool3)

print(MemoryLayout.size(ofValue: bool2))




// 4 - Type Conversion

var a = 100
var b = 3.14
//print(a * b) => error (both operands of the multiplication should be the same type)
print(Double(a) * b)               // 314.0
print(Int(b) * a)                  // 300






// 5 - Print

// Semicolon
//  required if you want to write multiple separate statements on a single line
let cat = "Scottish Fold"; print(cat)


// String Interpolation

let name = "Jane"
let age = 21

print("Her name is \(name) and she is \(age) years old.")

// Multi-line Strings

var quote = """
Change the world
 by
being yourself
"""

print(quote)






// 6 - Optionals
// In situations where a value may be absent

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)       // type "Int?", or "optional Int"

var serverResponseCode : Int? = nil             // contains no value

var surveyAnswer : String?                      // automatically set to nil

var value1 : Int?
var value2 : Int = value1 ?? 0
print(value2)                                   // prints 0


var value3 : Int? = 10
var value4 : Int? = value3 ?? -1
print(value4)                                   // prints Optional(10)

/*  - Forced Unwrapping -
    to find out whether an optional contains a value
    Trying to use ! to access a nonexistent optional value triggers a runtime error.*/
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}


/*  - Optional Binding -
    to find out whether an optional contains a value,
    and if so, to make that value available as a temporary constant or variable. */
if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}


// - Implicitly Unwrapped Optionals -

let possibleString: String? = "An optional string."
let forcedString: String = possibleString!

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString
