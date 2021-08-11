import UIKit

/* It defines a common type for a group of related values and enables to work
   with those values in a type-safe way within the code. */

enum Days {
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}

enum DateOfBirth {
    case Date(Day: Int, Month: Int, Year: Int)
    case Day(Days)
}

var date1 = DateOfBirth.Date(Day: 2, Month: 5, Year: 1995)
var day1 = DateOfBirth.Day(.Friday)

if case let DateOfBirth.Date(Day: day, Month: month, Year: year) = date1 {
    print("Day: \(day)\nMonth:\(month)\nYear:\(year)")
}

if case let DateOfBirth.Day(value) = day1 {
    print(value)
}





// --- Class & Enum ---


enum SongGenre {
    case Pop
    case Classic
    case House
    case Dubstep
    case Rock
}

class Song {
    var name: String
    var singer: String
    var year: Int
    var genre: SongGenre

    init(name: String, singer: String, year: Int, genre: SongGenre) {
        self.name = name
        self.singer = singer
        self.year = year
        self.genre = genre
    }

    func info() {
        print("Name: \(name)\nSinger: \(singer)\nYear: \(year)\nGenre: \(genre)")
    }
}

var song1 : Song = Song(name: "The Way", singer: "Dennis Lloyd", year: 2021, genre: .Pop)
song1.info()





// --- Enum & Switch ---


var today = Days.Friday

switch today {
case .Saturday, .Sunday:
    print("Yay! It's weekend :) ")
default:
    print("Sorry it's not weekend and you have to work :( ")
}






// --- Nested Enums ---

enum PersonInfo {

    enum HairColor {
        case Black
        case Brown
        case Red
        case Blond
    }

    enum HairType {
        case Straight
        case Wavy
        case Curly
    }

    enum EyeColor {
        case Black
        case Brown
        case Hazel
        case Green
        case Blue
    }

    case Turkish
    case Swedish
    case Albanian

}

var person : PersonInfo = PersonInfo.Turkish
var hair : PersonInfo.HairType = .Straight
var eye : PersonInfo.EyeColor = .Blue
print("\(person)\n\(hair)\n\(eye)")





// --- Enum & Static Function ---

enum AppleProducts {
    case MacbookPro, iMac, iPhone, iWatch
    static func getAppleProducts(name: String) -> AppleProducts? {
        let name = name.lowercased()
        switch name {
        case "phone": return .iPhone
        case "watch": return .iWatch
        case "laptop": return .MacbookPro
        case "desktop": return .iMac
        default: print("Unknown")
            return nil
        }
    }
}

if let product = AppleProducts.getAppleProducts(name: "Phone") {
    print(product)
} else {
    "Not found"
}





// --- Enum init feature ---

enum Products {
    case GameConsole, Phone

    init(productName: String) {
        switch productName {
        case "ps5" : self = .GameConsole
        case "xiaomi" : self = .Phone
        default : self = .GameConsole
        }
    }
}

let product1 = Products(productName: "ps5")
print(product1)



enum Height {
    case Long
    case Medium
    case Short
    init(heightValue: Int) {
        switch heightValue {
        case 0..<150 : self = .Short
        case 150..<180 : self = .Medium
        case 180..<250 : self = .Long
        default : self = .Medium
            print("Unknown height")
        }
    }
}

print(Height(heightValue: 168))







// --- Recursive Enumerations ---

// indicate that an enumeration case is recursive by writing indirect before it

indirect enum ArithmeticExpression {
    case number(value: Int)
    case addition(number1: ArithmeticExpression, number2: ArithmeticExpression)
    case subtraction(number1: ArithmeticExpression, number2: ArithmeticExpression)
    case multiplication(number1: ArithmeticExpression, number2: ArithmeticExpression)
    case division(number1: ArithmeticExpression, number2: ArithmeticExpression)
}

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value): return value
    case let .addition(value1, value2): return evaluate(value1) + evaluate(value2)
    case let .subtraction(value1, value2): return evaluate(value1) - evaluate(value2)
    case let .multiplication(value1, value2): return evaluate(value1) * evaluate(value2)
    case let .division(value1, value2): return evaluate(value1) / evaluate(value2)

    }
}


let exp1 : ArithmeticExpression = ArithmeticExpression.multiplication(number1: ArithmeticExpression.addition(number1: .number(value: 23), number2: .number(value: 4)), number2: ArithmeticExpression.subtraction(number1: .number(value: 50), number2: .number(value: 29)))
print(evaluate(exp1))
