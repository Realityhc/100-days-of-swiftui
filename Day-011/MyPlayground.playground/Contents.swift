import Foundation

var greeting = "Hello, playground"

struct BankAccount {
   private var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 31)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

AppData.version

struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}

Employee.example

// Checkpoint 6

struct Car {
    let model: String
    let numberOfSeats: Int
    // private(set) захищає нашу передачу від прямого втручання ззовні
    private(set) var currentGear = 1
    
    // mutating, бо ми змінюємо значення всередині структури
    mutating func shiftGear(up: Bool) {
        if up == true {
            // Перемикаємо вгору, але перевіряємо ліміт (нехай максимум буде 10 передач)
            if currentGear < 10 {
                currentGear += 1
                print("Перемикаємо вгору! Поточна передача: \(currentGear)")
            } else {
                print("Увага: Це вже максимальна передача!")
            }
        } else {
            // Перемикаємо вниз, але не менше 1-ї передачі (або 0 для нейтралки)
            if currentGear > 1 {
                currentGear -= 1
                print("Перемикаємо вниз! Поточна передача: \(currentGear)")
            } else {
                print("Увага: Це вже перша передача, нижче нікуди!")
            }
        }
    }
}

// Тестуємо нашу машинку:
var myCar = Car(model: "DeLorean", numberOfSeats: 2)

myCar.shiftGear(up: true)   // Передача стане 2
myCar.shiftGear(up: true)   // Передача стане 3
myCar.shiftGear(up: false)  // Передача стане 2
print("Машина \(myCar.model) зараз на \(myCar.currentGear) передачі.")

// 🗡️ Day 11 Challenge: Таємна крамниця Амо

struct MagicShop {
    static var totalGoldEarned = 0
    private(set) var shopGold = 0
    mutating func sellItem(price: Int) {
        shopGold += price
        MagicShop.totalGoldEarned += price
        print("Дзінь! 💰 Товар продано за \(price) золотих!")
    }
}

var magicWorldShop = MagicShop()
magicWorldShop.sellItem(price: 50)
magicWorldShop.sellItem(price: 150)

print("У касі крамниці: \(magicWorldShop.shopGold)") // має вивести 200
print("Загалом мережа заробила: \(MagicShop.totalGoldEarned)") // має вивести 200
