import UIKit

// Error handling is the process of responding to and recovering from error conditions in the program

enum AgeError : Error {
    case maxAgeError
    case minAgeError
}

func enrollCourse(age: Int) throws {

    if age > 30 {
        throw AgeError.maxAgeError
    } else if age < 18 {
        throw AgeError.minAgeError
    } else {
        print("You can enroll this course.")
    }
}


do {
    try enrollCourse(age: 15)
} catch AgeError.maxAgeError {
    print("You can't enroll this roll, you are old.")
} catch AgeError.minAgeError {
    print("You're young to enroll this course.")
}




// Login Example

enum Login: Error {
    case wrongPassword, wrongUsername
    case emptyPassword, emptyUsername
}


func login(username: String, password: String) throws {

    guard !username.isEmpty else {
        throw Login.emptyUsername
    }
    guard !password.isEmpty else {
        throw Login.emptyPassword
    }
    guard username == "crncck" else {
        throw Login.wrongUsername
    }
    guard password == "1234" else {
        throw Login.wrongPassword
    }

    print("Successful login, Welcome \(username)")

}

func performLogin(username: String, password: String) throws {
    do {
        try login(username: username, password: password)
    } catch Login.emptyPassword {
        print("Empty password.")
    } catch Login.emptyUsername {
        print("Empty username.")
    } catch Login.wrongPassword {
        print("Wrong password.")
    } catch Login.wrongUsername {
        print("Wrong username.")
    }
    
}

try performLogin(username: "crn", password: "123")                  // Wrong username
try performLogin(username: "crncck", password: "12")                // Wrong password
try performLogin(username: "crncck", password: "1234")              // Successful login, Welcome crncck

