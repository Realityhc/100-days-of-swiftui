import Foundation

var greeting = "Hello, playground"

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)


// ефективний приклад
//class Car: Vehicle {
//    let isConvertible = false
//}
//
//let teslaX = Car(isElectric: true)

class Vehicle2 {
    var wheels: Int
    init(wheels: Int) {
        self.wheels = wheels
    }
}
class Truck: Vehicle2 {
    var goodsCapacity: Int
    init(wheels: Int, goodsCapacity: Int) {
        self.goodsCapacity = goodsCapacity
        super.init(wheels: wheels)
    }
}

class User {
    var username = "Anonymous"
}
var user1 = User()

var user2 = user1
user2.username = "Taylor"

print(user1.username)
print(user2.username)

//  Якщо ви хочете створити унікальну копію екземпляра класу – іноді її називають глибокою копією – вам потрібно безпечно обробити створення нового екземпляра та скопіювати всі ваші дані. У нашому випадку це просто:

class User3 {
    var username = "Anonymous"

    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

//  Тепер ми можемо безпечно викликати copy(), щоб отримати об'єкт з тими ж початковими даними, але будь-які майбутні зміни не вплинуть на оригінал. В цьому випадкуу рядок 97 var user2 = user1 потрібно замінити на var user2 = user1.copy()

class User4 {
    let id: Int
    init(id: Int) {
        self.id = id
        print("User \(id): Create!")
    }
        deinit {
            print("User \(id): Clear!")
    }
}

for i in 1...3 {
    let user4 = User4(id: i)
    print("User \(user4.id): I'm checking the situation.")
}

//  Наприклад, якби ми додавали наші User екземпляри в міру їх створення, вони б очищувались черещ деініціалізатор лише після очищення масиву:

var users = [User4]()

for i in 1...3 {
    let user = User4(id: i)
    print("User \(user.id): I'm checking the situation.")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

class User2 {
    var name = "Paul"
}

var user = User2()
user.name = "Taylor"
user = User2()
print(user.name)

// Checkpoint 7
class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
    
    func speak() {
        print("animal sound")
    }
}

class Dog: Animal {
    init() {
        super.init(legs: 4)
    }
    
    override func speak() {
        print("Woof")
    }
}

class Cat: Animal {
    var isTame: Bool // 1. Додаємо властивість сюди
    
    // 2. Створюємо init, який вимагає вказати, чи приручений кіт
    init(isTame: Bool) {
        self.isTame = isTame // 3. Спочатку ставимо галочку для своєї властивості
        super.init(legs: 4)  // 4. Потім просимо батька поставити галочку для ніг (у котів їх 4)
    }
    
    override func speak() {
        print("Meow")
    }
}

class Corgi: Dog {
    override func speak() {
        print("WoofWoof")
    }
}
    class Poodle: Dog {
        override func speak() {
            print("WooOooOf")
        }
    }
    class Persian : Cat {
        override func speak() {
            print("Meoooow")
        }
    }
    class Lion : Cat {
        override func speak() {
            print("MeooOooOow")
        }
}

let myCorgi = Corgi()
myCorgi.speak() // Виведе "WoofWoof"

let kingLion = Lion(isTame: false)
kingLion.speak() // Виведе "MeooOooOow"

// 🗡️ Day 12 Challenge: Академія Фамільярів

class Familiar {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func castSpell() {
        print("✨ \(name) чаклує базове заклинання!")
    }
}

class DragonFamiliar: Familiar {
    override func castSpell() {
        print("🔥 \(name) дихає вогнем!")
    }
}

let spirit = Familiar(name: "Каспер")
let spyro = DragonFamiliar(name: "Спайро")
spirit.castSpell()
spyro.castSpell()
