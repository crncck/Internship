import UIKit


// Arrays

var array : [Int] = []        // empty array
print("Array is of type [Int] with \(array.count) items.")

array.append(5)               // add items
array.append(8)
print(array)

array = []                    // to empty
print(array)


var array2 = Array(repeating: 0.1, count: 3)      // array with a default value
var array3 = Array(repeating: 1.2, count: 3)

var array4 = array3 + array2
print("1.Array: \(array2)")
print("2.Array: \(array3)")
print("3.Array: \(array4)")


var fruits : [String] = ["Apple", "Banana"]
fruits += ["Grape", "Orange"]
print(fruits)

print(fruits[2])
fruits[2] = "Pear"                                  // ["Apple", "Banana", "Pear", "Orange"]

fruits[1...3] = ["Watermelon", "Melon", "Apple"]    // ["Apple", "Watermelon", "Melon", "Apple"]
print(fruits)

fruits.insert("Coconut", at: 0)                     // ["Coconut", "Apple", "Watermelon", "Melon", "Apple"]


let new_array = fruits.removeLast()                 // Apple


for fruit in fruits {
    print(fruit)
}

for (index, value) in fruits.enumerated() {
    print("Item \(index + 1): \(value)")
}






// Sets

var numbers = Set<Int>()
print("Numbers is of type Set<Int> with \(numbers.count) items.")

numbers.insert(1)
numbers = []

var Names : Set<String> = ["Jane", "Jack", "Mary"]

Names.insert("Tim")

for name in Names {
    print("\(name)")
}

for name in Names.sorted() {
    print("\(name)")
}


let set1: Set = [ "a", "b"]
let set2: Set = [ "d", "e", "a", "k", "l", "b"]
let set3: Set = [ "a", "e", "b"]

set1.isSubset(of: set2)             // true
set2.isSuperset(of: set3)           // true
set1.isDisjoint(with: set3)         // false






// Dictionaries

var namesOfIntegers : [Int: String] = [:]
namesOfIntegers[4] = "four"
namesOfIntegers = [:]

var capitals: [String: String] = ["Turkey": "Ankara", "Sweden": "Stockholm"]

print("The capitals dictionary contains \(capitals.count) items.")

capitals["Germany"] = "Berlin"

capitals["Turkey"] = nil


for (country, capital) in capitals {
    print("\(country): \(capital)")
}

let countryNames = [String](capitals.keys)
let capitalNames = [String](capitals.values)
