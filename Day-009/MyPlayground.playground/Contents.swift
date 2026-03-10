import Foundation // Імпортує базовий фреймворк Foundation, який містить основні типи даних та інструменти в Swift.

var greeting = "Hello, playground" // Створює змінну `greeting` (значення якої можна змінювати) з рядком "Hello, playground".

func greetUser() { // Оголошує функцію `greetUser`, яка не приймає параметрів.
    print("Hi there!") // Виводить рядок "Hi there!" у консоль.
}

greetUser() // Викликає функцію `greetUser`, що призведе до виводу "Hi there!".

var greetCopy = greetUser // Робить копію функції `greetUser` та призначає її змінній `greetCopy` (тут немає дужок `()`, бо ми беремо саму функцію, а не викликаємо її).
greetCopy() // Викликає скопійовану функцію, що знову надрукує "Hi there!".

let sayHello = { // Створює замикання (closure) і призначає його константі `sayHello`.
    print("Hi there!") // Тіло замикання, аналогічне тілу функції.
}

sayHello() // Викликає замикання `sayHello`.

let sayHello2 = { (name: String) -> String in // Створює замикання, яке приймає один параметр `name` (тип String) і повертає значення типу String. Ключове слово `in` відокремлює параметри від тіла замикання.
    "Hi \(name)!" // Тіло замикання. Оскільки тут лише один рядок, `return` мається на увазі автоматично (implicit return).
}

sayHello2("Jinx") // Викликає замикання `sayHello2` з аргументом "Jinx". Поверне "Hi Jinx!".

// Приклад
//var greetCopy: () -> Void = greetUser // Закоментований приклад того, як явно вказати тип: замикання, яке нічого не приймає `()` і нічого не повертає `-> Void`.

func getUserData(for id: Int) -> String { // Оголошує функцію. `for` — зовнішнє ім'я параметра (для читабельності при виклику), `id` — внутрішнє ім'я (для використання всередині функції). Повертає рядок.
    if id == 1989 { // Перевіряє умову.
        return "Taylor Swift" // Якщо підходить, повертає значення і виходить з функції.
    } else {
        return "Anonymous" // В іншому випадку повертає це значення.
    }
}

let data: (Int) -> String = getUserData // Призначає функцію `getUserData` константі `data` з явним типом підпису функції: приймає Int, повертає String.
let user = data(1989) // Викликає функцію через її нове посилання, передаючи аргумент 1989.
print(user) // Виводить "Taylor Swift".

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"] // Створює константний масив рядків (імена команди).

// Закоментований приклад базового сортування (за алфавітом):
//let sortedTeam = team.sorted()
//print(sortedTeam)

// Закоментований приклад сортувальної функції, яка ставить "Suzanne" на перше місце:
//func captainFirstSorted(name1: String, name2: String) -> Bool {
//    if name1 == "Suzanne" {
//        return true
//    } else if name2 == "Suzanne" {
//        return false
//    }
//    return name1 < name2
//}

// Закоментований виклик методу sorted з передачею власної функції сортування:
//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)

// Виклик сортування із передачею inline-замикання:
let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in // Те саме сортування, але з використанням замикання безпосередньо у виклику методу. Описані типи параметрів та що повертається.
    if name1 == "Suzanne" { // Якщо першим іде капітан Suzanne, він "менший" (повинен бути першим).
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2 // Якщо це не капітан, сортуємо звичайним алфавітним порівнянням.
})
print(captainFirstTeam)

/*
 Якщо ви пам'ятаєте, sorted() може приймати будь-яку функцію для виконання власного сортування з одним правилом: ця функція повинна приймати два елементи з відповідного масиву (тут це два рядки) та повертати логічне значення, що дорівнює true, якщо перший рядок має бути відсортований раніше за другий...
 (Текст залишено як багаторядковий коментар для зручності читання)
*/

// Варіант 2: Використання Trailing Closure (замикання, що йде за функцією) та виведення типів (Type Inference):
let captainFirstTeam2 = team.sorted { name1, name2 in // Swift сам розуміє, що name1 і name2 – це рядки, а повертатися має Bool, тому ми не пишемо типи. Дужки `(by: )` також можна опустити.
    if name1 == "Suzanne" {
           return true
    } else if name2 == "Suzanne" {
           return false
    }
    
    return name1 < name2
}
print(captainFirstTeam2)

// Варіант 3: Скорочені імена аргументів (Shorthand Argument Names):
let captainFirstTeam3 = team.sorted { // Замість оголошення імен параметрів (name1, name2), використовуємо скорочені імена: $0 та $1.
    if $0 == "Suzanne" { // $0 — перший аргумент порівняння.
        return true
    } else if $1 == "Suzanne" { // $1 — другий аргумент.
        return false
    }
    
    return $0 < $1
}
print(captainFirstTeam3)

/*
 Я залишив цей наостанок, бо він не такий чіткий, як інші – деякі люди бачать цей синтаксис і ненавидять його, бо він менш зрозумілий, і це нормально...
*/

let reverseTeam = team.sorted {
    return $0 > $1 // Можна використовувати короткий синтаксис просто для зворотного сортування (по спаданню).
}

// Варіант 4: Якщо в замиканні лише 1 рядок коду, `return` можна пропустити:
let reverseTeam2 = team.sorted { $0 > $1 } 

print(reverseTeam2)

// Метод filter: залишає в масиві лише ті елементи, які відповідають вказаній умові (повертають true).
let tOnly = team.filter { $0.hasPrefix("T") } // Проходиться по кожному елементу $0 і залишає лише ті, що починаються на літеру "T" (Tiffany та Tasha).
print(tOnly)

// Метод map: застосовує правило до кожного елементу і створює з результатів новий масив.
let uppercaseTeam = team.map { $0.uppercased() } // Бере кожен елемент $0 і викликає для нього uppercased(), перетворюючи текст на ВЕЛИКІ ЛІТЕРИ.
print(uppercaseTeam)

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

//  В результаті ми можемо створювати цілочисельні масиви довільного розміру, передаючи функцію, яка має використовуватися для генерації кожного числа:

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)

//  І пам’ятайте, що ця сама функціональність працює і зі спеціалізованими функціями, тому ми могли б написати щось на кшталт цього:

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

// Це призведе до generateNumber()50 викликів для заповнення масиву. Поки ви вивчаєте Swift та SwiftUI, вам лише кілька разів знадобиться знати, як приймати функції як параметри, але принаймні тепер ви маєте уявлення про те, як це працює та чому це важливо. Перш ніж ми продовжимо, залишилося ще одне: ви можете зробити так, щоб ваша функція приймала кілька параметрів, якщо хочете, і в цьому випадку ви можете вказати кілька завершальних замикань. Цей синтаксис дуже поширений у SwiftUI, тому важливо хоча б показати вам його дещо. Щоб продемонструвати це, ось функція, яка приймає три параметри, кожен з яких не приймає жодних параметрів і нічого не повертає:

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

//  Я додав print()туди додаткові виклики, щоб імітувати певну роботу, що виконується між викликами first, secondта .third коли справа доходить до виклику цього, перше завершальне замикання ідентичне тому, що ми вже використовували, але друге та третє форматуються по-різному: ви завершуєте фігурну дужку з попереднього замикання, потім записуєте назву зовнішнього параметра та двокрапку, а потім починаєте іншу фігурну дужку. Ось як це виглядає:

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

// Checkpoint 5

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// Магія ланцюжків Swift!
let result = luckyNumbers
    .filter { !$0.isMultiple(of: 2) } // 1. Фільтруємо: залишаємо числа, які НЕ (!) кратні 2 (тобто непарні)
    .sorted()                         // 2. Сортуємо: за замовчуванням сортує за зростанням
    .map { "\($0) is a lucky number" } // 3. Перетворюємо (Map): кожне число підставляємо в рядок

// 4. Друкуємо кожен елемент нового масиву на окремому рядку

for item in result {
    print(item)
}

// 🗡️ Day 9 Challenge: Арсенал Aura

let spellPower = [15, 50, 8, 85, 30, 12, 65]
let readySpells = spellPower

    .filter { $0 > 20 }
    .sorted { $0 > $1 }
    .map { "Aura кастує заклинання силою \($0)! ✨" }

for spell in readySpells {
    print(spell)
}
