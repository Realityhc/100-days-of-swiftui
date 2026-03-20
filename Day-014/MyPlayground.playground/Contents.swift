import Foundation

var greeting = "Hello, playground"

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}

//  Перш ніж ми закінчимо, я хочу згадати ще одне: під час розгортання необов'язкових елементів їх дуже часто розгортають у константу з тим самим ім'ям. Це цілком допустимо в Swift, і це означає, що нам не потрібно зберігати константи з іменами unwrappedNumberчи подібні функції. Використовуючи цей підхід, ми могли б переписати попередній код таким чином:

if let number = number {
    print(square(number: number))
}

//  Такий стиль трохи заплутує, коли вперше читаєш, бо тепер це схоже на квантову фізику – чи може вона numberбути одночасно і необов’язковою , і обов’язковою? Ну, ні. Тут відбувається те, що ми тимчасово створюємо другу константу з такою ж назвою, доступну лише всередині тіла умови. Це називається затіненням (shadowing ), і воно в основному використовується з необов'язковими розгортаннями, як ви можете бачити вище. Отже, всередині тіла умови ми маємо розгорнуте значення для роботи – дійсне, Intа не необов'язкове Int?– але зовні у нас все ще є необов'язкове.
var favoriteMovie: String? = nil
favoriteMovie = "The Life of Brian"

// Як розгорнути додаткові елементи за допомогою захисту

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        
        // 1: We *must* exit the function here
        return
    }

    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}

func checkMyVar() {
    var myVar: Int? = 3
    if let unwrapped = myVar {
        print("Run if myVar has a value inside")
    }

    guard let unwrapped = myVar else {
         print("Run if myVar doesn't have a value inside")
        return // <- Ось наша катапульта! Тепер охоронець задоволений.
            }
            print("Ура, є значення: \(unwrapped)")
}



func test(number: Int?) {
    guard let number = number else { return }
    print("Number is \(number)")
}
test(number: 42)

func username(for id: Int?) -> String? {
    guard let id = id else {
        return nil
    }
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
if let user = username(for: 1989) {
    print("Hello, \(user)!")
}

//  Як розгорнути опціонали за допомогою об'єднання nil
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity", default: "N/A"] //?? "N/A"

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"
    
struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let number2 = Int(input) ?? 0
print(number2)
//

let planetNumber: Int? = 426
var destination = planetNumber ?? 3

//  Як обробляти кілька необов'язкових елементів за допомогою ланцюжка необов'язкових елементів

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

struct Book2 {
    let title: String
    let author: String?
}

var book2: Book2? = nil
let author2 = book2?.author?.first?.uppercased() ?? "A"
print(author2)

//  Як обробляти збій функції з опціональними елементами

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
    //  Ось тут і try?допомагає: він getUser()повертає необов'язковий рядок, який буде дорівнювати nil, якщо виникнуть помилки. Якщо ви хочете точно знати, яка помилка сталася, то цей підхід не буде корисним, але найчастіше нам це просто байдуже. Якщо хочете, можете поєднати це try?з nil coalescing, що означає «спробувати отримати повернене значення від цієї функції, але якщо це не вдасться, використовувати це значення за замовчуванням».
}
//  Будьте обережні: перед об'єднанням nil потрібно додати кілька дужок, щоб Swift точно зрозумів, що ви маєте на увазі. Наприклад, ви б написали так:

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

// Checkpoint 9

func getRandomNumber(from array: [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 1...100)
}

print(getRandomNumber(from: [10, 20, 30]))
print(getRandomNumber(from: nil))
print(getRandomNumber(from: []))

// 🗡️ Day 14 Challenge: Фінальний акорд (Привітання користувача)

func greetUser(name: String?) -> String {
    "Привіт, \(name ?? "Гість")!"
}

print(greetUser(name: "Амо")) // має вивести: Привіт, Амо!
print(greetUser(name: nil))   // має вивести: Привіт, Гість!

