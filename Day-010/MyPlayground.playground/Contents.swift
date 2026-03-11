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
    var vacationAllocated = 14
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
archer3.vacationRemaining = 5
print(archer3.vacationAllocated)


