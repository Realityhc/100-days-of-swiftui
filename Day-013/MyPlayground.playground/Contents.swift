import Foundation

var greeting = "Hello, playground"

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
    
    let name = "Car"
    var currentPassengers = 1
}

let car = Car()
commute(distance: 100, using: car)

struct Bicycle: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
    
    let name = "Bicycle"
    var currentPassengers = 1
}

let bike = Bicycle()
commute(distance: 50, using: bike)

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

getTravelEstimates(using: [car, bike], distance: 150)

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

protocol View { }



print(getRandomNumber())
print(getRandomBool())
print(getRandomNumber() == getRandomNumber())

var quote = "   The truth is rarely pure and never simple   "

let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let trimmed2 = quote.trimmed()

func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

let trimmed3 = trim(quote)

quote.trim()

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}
let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

extension Double {
    var isNegative: Bool {
        return self < 0
    }
}
extension String {
    var isLong: Bool {
        return count > 25
    }
}

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}

// Деякі люди надають перевагу використанню булевого !оператора, наприклад:

if !guests.isEmpty {
    print("Guest count: \(guests.count)")
}

// Мені не дуже подобається жоден із цих підходів, бо вони просто не читаються для мене природно: «якщо ні, то деякий масив порожній»? Ми можемо виправити це за допомогою дуже простого розширення для Array, ось такого:

// extension Collection {
//     var isNotEmpty: Bool {
//         isEmpty == false
//     }
//}

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

// Checkpoint 8
protocol Building {
    var rooms: Int { get }
    var cost: Int { get set }
    var agentName: String { get set }
    
    func printSalesSummary()
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var agentName: String
    
    func printSalesSummary() {
        print("🏠 продається затишний будинок! кімнат: \(rooms). ціна: $\(cost). звертайтеся до агента на ім'я \(agentName).")
    }
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var agentName: String
    
    func printSalesSummary() {
        print("🏢 комерційна нерухомість. ідеальний офіс на \(rooms) приміщень. вартість: $\(cost). ваш менеджер: \(agentName).")
    }
}

// перевіряємо магію:
var myDreamHouse = House(rooms: 5, cost: 250_000, agentName: "Амо")
myDreamHouse.printSalesSummary()

var startupOffice = Office(rooms: 10, cost: 1_200_000, agentName: "Рена")
startupOffice.printSalesSummary()

// 🗡️ day 13 challenge: гільдія магів (міні-версія)

protocol Spell {
    var name: String { get }
}

extension Spell {
    func cast() {
        print("✨ ти чаклуєш заклинання: \(name)!")
    }
}

struct Fireball: Spell {
    var name = "Вогняна куля"
}

var fireball = Fireball()
fireball.cast()
