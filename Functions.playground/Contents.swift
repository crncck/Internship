import UIKit


func greetPerson(name: String, age: Int) -> String {
    return "Hello, your name is " + name + " and your age is " + String(age) + "."
}

print(greetPerson(name: "Ceren", age: 22))



// Without parameters
func sayHello() -> String {
    return "Hello!"
}

print(sayHello())


// Without return
func sayHelloPerson(name : String) {
    print("Hello \(name)")
}

sayHelloPerson(name: "Ceren")


// Multiple return values
func getTime(day: Int) -> (Int, Int, Int) {
    let hour = day * 24
    let minute = hour * 60
    let second = minute * 60
    return (hour, minute, second)
}

print(getTime(day: 10))



/* Implicit return
   if the entire body of the function is a single expression */

func impFunc(name: String) -> String {
    "Hello " + name + "!"
}

print(impFunc(name: "Dave"))




/* Argument label
   It is used when calling the function.
   If you don’t want an argument label for a parameter, write an underscore (_) */

func sayHello(name: String, from hometown: String) -> String {
    return "Hello \(name)! Sending our love to \(hometown)."
}
print(sayHello(name: "Tim", from: "Stockholm"))


func sayHello2(name: String, _ hometown: String) -> String {
    return "Hello \(name)! Sending our love to \(hometown)."
}
print(sayHello2(name: "Tim", "Stockholm"))




// Default parameter values
func greetPerson(name: String, from: String = "Earth") -> String {
    return "Name: \(name) \nFrom: \(from)"
}

print(greetPerson(name: "Jack"))



// Variadic Parameters
func calculateMean (_ numbers: Int...) -> Double {
    var total = 0.0
    for number in numbers {
        total += Double(number)
    }
    return total / Double(numbers.count)
}

print(calculateMean(1, 2, 3, 4, 5))




/* In-out parameters
   To modify a parameter’s value, define that parameter as an in-out parameter instead */

func swapValues(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var c = 3, d = 5

print("Values before swapping: \(c), \(d)")
swapValues(&c, &d)
print("Values after swapping: \(c), \(d)")



// Function types
func addition(_ a: Int, _ b: Int) -> Int {
    return a + b
}

var mathOperation : (Int, Int) -> Int = addition               // has a type of ‘a function that takes two Int values, and returns an Int value.’
print("Result: \(mathOperation(1, 2))")







func factorial(_ number: Int) -> Int {
    let n = number
    if(n == 1){
      return 1
    }else{
      return n * factorial(n - 1)
    }
}

print(factorial(4))
