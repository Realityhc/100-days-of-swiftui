import Foundation

var greeting = "Hello, playground"

func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome()

let number = 139

if number.isMultiple(of: 2) {
    print("Even")
} else {
    print("Odd")
}

let roll = Int.random(in: 1...20)

func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20)

func check(age: Int) {
    if age >= 18 {
        print("You're an adult.")
    } else {
        print("You're a minor.")
    }
}
check(age: 18)

func square(numbers: [Int]) {
    for number in numbers {
        let squared = number * number
        print("\(number) squared is \(squared).")
    }
}
square(numbers: [2, 3, 4])

func sendTweet(text: String) {
    print("Posting to Twitter: \(text)")
}

func runDistance(kilometers: Int) {
    for _ in 1...kilometers {
        print("Let's run another kilometer...")
    }
}

let root = sqrt(169)
print(root)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

// Приклад
// func areLettersIdentical(string1: String, string2: String) -> Bool {
//     let first = string1.sorted()
//     let second = string2.sorted()
//     return first == second
// }

    // Ефективний спосіб
func areLettersIdentical(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}

// Це менше коду, але ми можемо зробити ще краще. Бачите, ми сказали Swift, що ця функція повинна повертати логічне значення, і оскільки у функції є лише один рядок коду, Swift знає, що саме він має повертати дані. Через це, коли функція має лише один рядок коду, ми можемо returnповністю видалити ключове слово, ось так:
//
// func areLettersIdentical(string1: String, string2: String) -> Bool {
// string1.sorted() == string2.sorted()
// }

// Ми можемо повернутися назад і зробити те саме для rollDice()функції:
//
// func rollDice() -> Int {
// Int.random(in: 1...6)
// }

func pythagoras (a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)

// Ефективний спосіб

// func pythagoras(a: Double, b: Double) -> Double {
//     sqrt(a * a + b * b)
// }
// let c = pythagoras(a: 3, b: 4)
// print(c)

// Приклад
// func isUppercase(string: String) -> Bool {
//     string == string.uppercased()
// }
//
// let isUpper = isUppercase(string: "Hello")
// print(isUpper)
//
// func getUser() -> [String] {
//     ["Taylor", "Swift"]
// }
//
// let user = getUser()
// print("Name: \(user[0]) \(user[1])")

// Ефективніший спосіб

// func getUser() -> [String: String] {
//     [
//         "firstName": "Taylor",
//         "lastName": "Swift"
//     ]
// }
//
// let user = getUser()
// print("Name: \(user["firstName", default: "Anonymous"]) \(user["lastName", default: "Anonymous"])")

// Найкращий спосіб кортеж

func getUser() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")

// Інший варіант
//func getUser() -> (firstName: String, lastName: String) {
//    ("Taylor", "Swift")
//}

//  Іноді трапляються кортежі, елементи яких не мають імен. У такому разі можна отримати доступ до елементів кортежу за допомогою числових індексів, починаючи з 0, ось так:
// func getUser() -> (String, String) {
//     ("Taylor", "Swift")
//}
//
// let user = getUser()
// print("Name: \(user.0) \(user.1)")
//

//  Зрештою, якщо функція повертає кортеж, ви можете розбити цей кортеж на окремі значення, якщо хочете.
//
//func getUser() -> (firstName: String, lastName: String) {
//    (firstName: "Taylor", lastName: "Swift")
//}
//
//let user = getUser()
//let firstName = user.firstName
//let lastName = user.lastName
//
//print("Name: \(firstName) \(lastName)")

//  ми можемо пропустити перший крок – ми можемо розділити повернене значення з getUser()на дві окремі константи, ось так:
//let (firstName, lastName) = getUser()
//print("Name: \(firstName) \(lastName)")

//  Цей синтаксис може спочатку викликати у вас запаморочення, але це насправді просто скорочення того, що ми мали раніше: перетворити кортеж із двох елементів, з якого ми отримуємо значення, getUser()на дві окремі константи. Фактично, якщо вам не потрібні всі значення з кортежу, ви можете піти далі, використовуючи , _щоб вказати Swift ігнорувати цю частину кортежу:

//let (firstName, _) = getUser()
//print("Name: \(firstName)")

func rollDice2(sides: Int, count: Int) -> [Int] {
    // Start with an empty array
    var rolls = [Int]()
    
    // Roll as many dice as needed
    for _ in 1...count {
        // Add each result to our array
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }
    
    // Send back all the rolls
    return rolls
}

let rolls = rollDice2(sides: 6, count: 4)

func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }

let lyric = "I see a red door and I want it painted black"
print(lyric.hasPrefix("I see"))

func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result2 = isUppercase(string: string)

//  Якщо ми додамо символ підкреслення перед назвою параметра, ми можемо видалити мітку зовнішнього параметра ось так:
// func isUppercase(_ string: String) -> Bool {
//    string == string.uppercased()
//}
//
//let string = "HELLO, WORLD"
//let result2 = isUppercase(string)

// Як приклад, ось ще одна функція, яку ми розглядали раніше:

func printTimesTables2(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables2(number: 5)

//  Цей код валідний для Swift, і ми могли б залишити його як є. Але сайт виклику не читається добре: printTimesTables(number: 5). Було б набагато краще ось так: Ви вже бачили, як ми можемо поставити _перед назвою параметра, щоб нам не потрібно було писати зовнішню назву параметра. Інший варіант — написати там другу назву: одну для зовнішнього використання, а іншу для внутрішнього. Ось як це виглядає:


func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)
// Порада: Раніше я згадував, що технічно значення, які ви передаєте у функцію, називаються «аргументами», а значення, які ви отримуєте всередині функції, називаються параметрами . Тут все трохи заплутується, оскільки тепер у визначенні функції поруч є мітки аргументів та назви параметрів. Як я вже казав, я використовуватиму термін «параметр» для обох, і коли різниця матиме значення, ви побачите, що я розрізняю їх за допомогою «зовнішньої назви параметра» та «внутрішньої назви параметра».

func greet(_ name: String) {
    print("Hi, \(name)!")
}
func climbMountain(_ name: String) {
    print("I'm going to climb \(name).")
}
climbMountain("Everest")

func evaluateJavaScript(_ input: String) {
    print("Yup, that's JavaScript alright.")
}

// Day 7 Challenge: Збір трофеїв!

// 1. Створюємо функцію з "_" (щоб приховати мітку)
// 2. Вказуємо, що вона повертає кортеж (gold та item)
func defeatMonster(_ monster: String) -> (gold: Int, item: String) {
    // 3. Просто повертаємо значення в дужках (Swift сам розуміє, що це return)
    (50, "Зілля здоров'я")
}

// 4. Викликаємо функцію (без слова monster: ) і зберігаємо результат
let loot = defeatMonster("Гоблін")

// 5. Друкуємо результат, дістаючи значення через крапку
print("Aura перемогла! Знайдено \(loot.gold) монет та \(loot.item).")
