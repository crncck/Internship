import UIKit

// It enables to write flexible, reusable functions and types that can work with any type, subject to requirements that has been defined.



// --- Any ---

func swapAny(number1: inout Any, number2: inout Any) {
    (number1, number2) = (number2, number1)
}

var n1 : Any = 5.1
var n2 : Any = "Hello"

print("\(n1) - \(n2)")                  // 5.1 - Hello
swapAny(number1: &n1, number2: &n2)
print("\(n1) - \(n2)")                  // Hello - 5.1




// --- Generics ---

func swapAll<T>(number1: inout T, number2: inout T) {
    (number1, number2) = (number2, number1)
}

var n3 : Double = 34.2
var n4 : Double = 23.4

print("\(n3) - \(n4)")                  // 34.2 - 23.4
swapAll(number1: &n3, number2: &n4)
print("\(n3) - \(n4)")                  // 23.4 - 34.2






// --- Type Constraints ---

func checkEquality <T: Equatable>(value1: T, value2: T) -> Bool {
    if value1 == value2 {
        print("Values are equal")
        return true
    } else {
        print("They are not equal")
        return false
    }
}

var result : Bool = checkEquality(value1: "value", value2: "Value")             // false
print(result)
var result2 : Bool = checkEquality(value1: 900, value2: 900)                    // true
print(result2)







func findMax<T: Comparable>(value1: T, value2: T) -> T {

    if type(of: T.self) == type(of: String.self) {
        let str1 : String = value1 as! String
        let str2 : String = value2 as! String
        if str1.count > str2.count {
            return value1
        } else if str1.count == str2.count {
            return value1
        } else {
            return value2
        }
    }

    if value1 > value2 {
        print("First value is bigger than the other one.")
        return value1
    } else if value1 == value2 {
        print("They are equal")
        return value1
    } else {
        print("Second value is bigger than the other one.")
        return value2
    }
}

var max1 : Double = findMax(value1: 19.5, value2: 25.3)                         // 25.3
print(max1)

var max2 : String = findMax(value1: "word", value2: "letter")                   // letter
print(max2)








func searchValue<T: Equatable>(value: T, array: [T]) -> Bool {
    var index : Int = 0
    var found = false
    while (index < array.count && found == false) {
        if value == array[index] {
            found = true
        } else {
            index += 1
        }
    }

    if found {
        return true
    } else {
        return false
    }
}

let numbers = [0, 1, 2, 3, 4, 5, 9]
let countries = ["Turkey", "Holland", "China", "Germany"]
print(searchValue(value: 8, array: numbers))                        // false
print(searchValue(value: "Turkey", array: countries))               // true






// --- Stack Example ---

struct Stack<Element> {
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}


var stackofNumbers = Stack<Int>()
stackofNumbers.push(1)
stackofNumbers.push(2)
stackofNumbers.push(3)
stackofNumbers.push(4)

let poppedValue = stackofNumbers.pop()
print(poppedValue)                                  // 4

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackofNumbers.topItem {
    print("The top item: \(topItem).")           // The top item: 3
}

