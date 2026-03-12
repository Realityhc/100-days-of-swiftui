import Foundation

var greeting = "Hello, playground"

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

struct Employee {
    let name: String
    var vacationRemaining: Int
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

//  Ми детально розглянемо структури в наступних кількох розділах, але спочатку я хочу дати деяким речам назви. Змінні та константи, що належать структурам, називаються властивостями. Функції, що належать структурам, називаються методами. Коли ми створюємо константу або змінну зі структури, ми називаємо це екземпляромAlbum – наприклад, можна створити десяток унікальних екземплярів структури. Коли ми створюємо екземпляри структур, ми робимо це за допомогою ініціалізатора, подібного до цього: Album(title: "Wings", artist: "BTS", year: 2016). Останнє може здатися трохи дивним спочатку, оскільки ми обробляємо нашу структуру як функцію та передаємо їй параметри. Це трохи так званий синтаксичний цукор – Swift непомітно створює спеціальну функцію всередині структури під назвою init(), використовуючи всі властивості структури як її параметри. Потім він автоматично обробляє ці два фрагменти коду як однакові:

var archer1 = Employee(name: "Sterling Archer", vacationRemaining: 14)
var archertest = Employee.init(name: "Sterling Archer", vacationRemaining: 14)

//  Ми раніше покладалися на цю поведінку. Колись, коли в Double, я вперше представив це, я пояснив, що не можна додавати an Int та Double, а натомість потрібно писати такий код:

let a = 1
let b = 2.0
let c = Double(a) + b

//  Тепер ви можете бачити, що насправді відбувається: власний Double тип Swift реалізовано як структура та має функцію ініціалізатора, яка приймає ціле число.

//  Порада: Якщо ви призначите значення за замовчуванням константній властивості, воно буде повністю видалено з ініціалізатора. Щоб призначити значення за замовчуванням , але залишити можливість його перевизначення за потреби, використовуйте змінну властивість.

struct Employee2 {
    let name: String
    var vacationRemaining: Int
}

var archer2 = Employee2(name: "Sterling Archer", vacationRemaining: 14)
archer2.vacationRemaining -= 5
print(archer2.vacationRemaining)
archer2.vacationRemaining -= 3
print(archer2.vacationRemaining)

struct Employee3 {
    let name: String
    var vacationAllocated = 10
    var vacationTaken = 0

    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }

        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer3 = Employee3(name: "Sterling Archer", vacationAllocated: 14)
archer3.vacationTaken += 4
// приклад get
print(archer3.vacationRemaining)
archer3.vacationRemaining = 5
print(archer3.vacationAllocated)

struct Game {
    var score = 0
}

var game = Game()
game.score += 10
print("Score is now \(game.score)")
game.score -= 3
print("Score is now \(game.score)")
game.score += 1

struct Game2 {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game2 = Game2()
game2.score += 10
game2.score -= 3
game2.score += 1

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

// Як створити власні ініціалізатори
struct Player {
    let name: String
    let number: Int
}

let player = Player(name: "Megan R", number: 15)

struct Player2 {
    let name: String
    let number: Int

    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}

//  Звісно, ​​наші користувацькі ініціалізатори не обов'язково повинні працювати так, як стандартний почленний ініціалізатор, який надає нам Swift. Наприклад, ми могли б сказати, що ви повинні вказати ім'я гравця, але номер футболки буде випадковим:

struct Player3 {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player3 = Player3(name: "Megan R")
print(player3.number)



// 🗡️ Day 10 Challenge: Гримуар Відьмочки

struct WitchProfile {
    let name: String
    var baseMana: Int
    
    var level: Int {
        didSet {
            print("🎉 \(name) досягла \(level) рівня!")
        }
    }
    
    var totalMana: Int {
        get {
            baseMana * level
        }
    }
    
    // 3. Спеціальний ініціалізатор (Custom Init)
    init(name: String, baseMana: Int) {
        self.name = name
        self.baseMana = baseMana
        self.level = 1 // автоматично ставимо 1 рівень при створенні
    }
    
    // 4. Метод мутації (Mutating Method)
    mutating func levelUp() {
        level += 1
    }
}

// ⚔️ Тестуємо магію:
var aura = WitchProfile(name: "Aura", baseMana: 50)

print("Початкова мана: \(aura.totalMana)") // Виведе 50
aura.levelUp() // Спрацює didSet і виведе: 🎉 Aura досягла 2 рівня!
print("Нова мана: \(aura.totalMana)") // Виведе 100
    
    
