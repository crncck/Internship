import UIKit

struct Person {
    var name: String
    var surname: String
    var birthYear: Int
    func calculateAge() -> Int {
        return 2021 - birthYear
    }
    func showPersonInfo() {
        print("Name: \(name) \nSurname: \(surname) \nAge: \(calculateAge())")
    }
    mutating func changeName(name: String) {
        self.name = name
    }
}

var jane: Person = Person(name: "Jane", surname: "Eyre", birthYear: 1985)
var jack: Person = Person(name: "Jack", surname: "Sparrow", birthYear: 1970)

jane.showPersonInfo()
print("\n")
jack.showPersonInfo()

jane.changeName(name: "Jane A")
print(jane.name)                    // Jane A




struct Book {
    var name: String
    var author: String
    var publishYear: Int
    var pages: Int
    var genre: String

    init(name: String, author: String, publishYear: Int, pages: Int, genre: String) {
        self.name = name
        self.author = author
        self.publishYear = publishYear
        self.pages = pages
        self.genre = genre
    }

    init(name: String, author: String) {
        self.name = name
        self.author = author
        publishYear = -1
        pages = -1
        genre = "Unknown"
    }
}

var book1 : Book = Book(name: "Martin Eden", author: "Jack London")
var book2: Book = Book(name: "The Royal Game", author: "Stefan Zweig", publishYear: 1943, pages: 144, genre: "Novella")


/*      Class  --> Reference Type Objects
        Struct --> Value Type Objects



    -- Reference Type: When we are initializing an object, RAM allocates memory space and address to it. Then assigns its memory address to the object.

        If we create two objects from a class and assign the second object to the first object, since they are reference type objects,
        they will point to the same memory address, so they are actually same objects. If we change one value of one of those objects
        the other one will be affected too.



    -- Value Type: It is a type whose value is copied when it's assigned to a variable or constant, or when it's passed to a function.

        If we create two objects from a struct and assign the second object to the first object, it will be the copy of the first one.
        Even if we change value of one of them, the other one won't be affected.


 */
