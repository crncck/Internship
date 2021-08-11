import UIKit


// --- Class & Convenience Init

class Person {
    var name: String
    var surname: String
    var age: Int
    var city: String

    init(name: String, surname: String, age: Int, city: String) {
        self.name = name
        self.surname = surname
        self.age = age
        self.city = city
    }

    convenience init() {
        self.init(name: "Unknown", surname: "Unknown", age: -1, city: "Unknown")
    }
}

var person1 : Person = Person()
print(person1.name)                     // Unknown






// --- inheritance ---

struct Grade {
    var lessonName: String
    var grade: Int
}


class Student: Person {
    var lessons: [Grade] = []
    func saveGrade(lesson: Grade) {
        lessons.append(lesson)
    }

    func showLessons() {
        for lesson in lessons {
            print("Name of the lesson: \(lesson.lessonName)\nGrade: \(lesson.grade)")
        }
    }
}

let jane = Person(name: "Jane", surname: "Eyre", age: 23, city: "Hamburg")
let jack = Student(name: "Jack", surname: "Hamilton", age: 21, city: "Berlin")

let comp_org = Grade(lessonName: "Computer Organization", grade: 87)
jack.saveGrade(lesson: comp_org)
jack.showLessons()





// --- Method Overriding ---

class Employee {
    var name: String
    var surname: String
    var department: String
    var salary: Int

    init(name: String, surname: String, department: String, salary: Int) {
        self.name = name
        self.surname = surname
        self.department = department
        self.salary = salary
    }

    func showInfo() {
        print("Name: \(self.name)\nSurname: \(self.surname)\nDepartment: \(self.department)\nSalary: \(self.salary)")
    }
}




class Manager: Employee {
    var position: String

    init(name: String, surname: String, department: String, salary: Int, position: String) {
        self.position = position
        super.init(name: name, surname: surname, department: department, salary: salary)
    }

    override init(name: String, surname: String, department: String, salary: Int) {
        self.position = "Unknown"
        super.init(name: name, surname: surname, department: department, salary: salary)
    }

    override func showInfo() {
        print("Name: \(self.name)\nSurname: \(self.surname)\nDepartment: \(self.department)\nSalary: \(self.salary)\nPosition: \(self.position)")
    }

}


let employee1: Employee = Employee(name: "Helena", surname: "Bow", department: "Human Resources", salary: 8000)
employee1.showInfo()

let manager1: Manager = Manager(name: "Max", surname: "Bow", department: "Human Resources", salary: 150000, position: "Manager")
manager1.showInfo()







// --- Polymorphism ---

class GeometricShape {

    var name: String

    init(name: String) {
        self.name = name
    }

    func calculateArea() -> Double {
        return 0.0
    }

    func calculatePerimeter() -> Double {
        return 0.0
    }
}


class Rectangle: GeometricShape {

    var side1: Double
    var side2: Double

    init(side1: Double, side2: Double) {
        self.side1 = side1
        self.side2 = side2
        super.init(name: "Rectangle")
    }

    override func calculateArea() -> Double {
        return side1 * side2
    }

    override func calculatePerimeter() -> Double {
        return 2 * (side1 + side2)
    }
}



class Square: Rectangle {

    init(side1: Double) {
        super.init(side1: side1, side2: side1)
        self.name = "Square"
    }

}


class Circle: GeometricShape {
    var radius: Double

    init(radius: Double) {
        self.radius = radius
        super.init(name: "Circle")
    }

    override func calculateArea() -> Double {
        return Double.pi * radius * radius
    }

    override func calculatePerimeter() -> Double {
        return 2 * Double.pi * radius
    }
}


var r1: Rectangle = Rectangle(side1: 13, side2: 20)
print(r1.name)
print(r1.calculateArea())
print(r1.calculatePerimeter())


var s1: Square = Square(side1: 5)
print(s1.name)
print(s1.calculateArea())
print(s1.calculatePerimeter())


var c1: Circle = Circle(radius: 3)
print(c1.name)
print(c1.calculateArea())
print(c1.calculatePerimeter())


func compareArea(r1: Rectangle, r2: Rectangle) {

    if r1.calculateArea() > r2.calculateArea() {
        print("First shape has bigger area.")
    } else if r1.calculateArea() == r2.calculateArea() {
        print("The areas are equal.")
    } else {
        print("The second shape has bigger area.")
    }
}

compareArea(r1: r1, r2: s1)






// --- Property Observer ---

// willSet - is called just before the value is stored.
// didSet - is called immediately after the new value is stored.

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}


let stepCounter = StepCounter()
stepCounter.totalSteps = 200






// --- Type Casting ---
// Upcasting - Is this movie a MediaItem?
// Downcasting - Is this MediaItem a movie?

class MediaItem {

    var name: String

    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {

    var director: String

    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {

    var artist: String

    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}


let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]


var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")



// Downcasting

for item in library {

    if let movie = item as? Movie {

        print("Movie: \(movie.name), dir. \(movie.director)")

    } else if let song = item as? Song {

        print("Song: \(song.name), by \(song.artist)")
    }

}





/*  --- Access Levels ---

    - Open / Public
    - Internal: enables entities to be used within any source file from their defining module, but not in any source file outside of that module.
    - Fileprivate: restricts the use of an entity to its own defining source file.
    - Private: restricts the use of an entity to the enclosing declaration.

*/





/* --- Static, final & class ---

    ! Static function cannot be overridden.
    ! You can override a class function.
*/





// --- Deinit ---

var value: Int = 10

class Value {

    init() {
        value = 15
        print("New object is created.")
    }

    deinit {
        print("The object is deleted.")
        value = -1
    }
}


print(value)

var value1: Value? = Value()
print(value)

value1 = nil
print(value)
