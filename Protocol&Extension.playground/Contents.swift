import UIKit


// Protocol - defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality.


protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "John Jack")





protocol BeingHuman {

    var name: String {get set}
    var surname: String {get set}
    var id: Int {get set}
    func sayHi()
}


class Turkish: BeingHuman {
    var name: String

    var surname: String

    var id: Int

    func sayHi() {
        print("Hi! My name is \(name).")
    }

    init(name: String, surname: String, id: Int) {
        self.name = name
        self.surname = surname
        self.id = id
    }

}

var person1: Turkish = Turkish(name: "Ceren", surname: "Cicek", id: 35235435345)
person1.sayHi()






class Rectangle: Comparable {
    static func < (r1: Rectangle, r2: Rectangle) -> Bool {
        return (r1.height * r1.length) < (r2.height * r2.length)
    }

    static func == (r1: Rectangle, r2: Rectangle) -> Bool {
        return (r1.height * r1.length) == (r2.height * r2.length)
    }

    var height: Int
    var length: Int

    init(height: Int, length: Int) {
        self.height = height
        self.length = length
    }
}


var r1: Rectangle = Rectangle(height: 5, length: 8)
var r2: Rectangle = Rectangle(height: 10, length: 3)

if r1 > r2 {
    print("First rectangle is bigger than the other.")
} else if r1 < r2 {
    print("The second rectangle is bigger the the other one.")
} else {
    print("The area of the rectangles are equal.")
}





// --- Protocol Data Source ---

class CustomViewController: UIViewController, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell - \(indexPath.row)")
        return cell
    }

    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}





// --- Extension ---

extension Int {

    var square : Int {
        return self * self
    }

    var next : Int {
        return self + 1
    }

    func factoriel() -> Int {
        var result = 1
        for i in (1...self) {
            result *= i
        }
        return result
    }
}


print(6.square)                 // 36
print(9.next)                   // 10
print(4.factoriel())            // 24




extension String {

    func reverse() -> String {

        var chars = [Character]()

        for char in self {
            chars.insert(char, at: 0)
        }

        return String(chars)
    }
}


var name: String = "Mars"
print(name.reverse())           // sraM
