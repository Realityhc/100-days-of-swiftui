import Foundation

var greeting = "Hello, playground"

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)

//var characters = ["Lana", "Pam", "Ray", "Sterling"]
//print(characters.count)
//characters.removeAll()
//print(characters.count)
//  Це додає деякі рядки до масиву, друкує його кількість, потім видаляє їх усі та знову друкує кількість. Для оптимізації продуктивності Swift надає масивам достатньо пам'яті для зберігання їхніх елементів, плюс трохи додатково, щоб вони могли трохи зростати з часом. Якщо до масиву додається більше елементів, Swift автоматично виділяє все більше і більше пам'яті, щоб витрачати якомога менше пам'яті. Коли ми викликаємо removeAll(), Swift автоматично видаляє всі елементи масиву, а потім звільняє всю пам'ять, призначену масиву. Зазвичай це те, що вам потрібно, адже зрештою ви видаляєте об'єкти не просто так. Але іноді – лише іноді – ви можете збиратися додати багато нових елементів назад до масиву, тому існує друга форма цієї функції, яка видаляє елементи, зберігаючи при цьому попередню ємність:

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

//  Це досягається за допомогою значення параметра за замовчуванням: keepingCapacityє логічним значенням зі значенням за замовчуванням false, щоб воно виконувало розумну дію за замовчуванням, водночас залишаючи відкритою можливість передавання цього значення trueдля випадків, коли ми хочемо зберегти існуючу ємність масиву. Як бачите, значення параметрів за замовчуванням дозволяють нам зберігати гнучкість у наших функціях, не роблячи їх виклик незручним більшу частину часу – вам потрібно надсилати деякі параметри лише тоді, коли вам потрібно щось незвичайне.

func parkCar(_ type: String, automatically: Bool = true) {
    if automatically {
        print("Nice - my \(type) parked itself!")
    } else {
        print("I guess I'll have to do it.")
    }
}
parkCar("Tesla")

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

//let string = "12345"
//
//do {
   // let result = try checkPassword(string)
  //  print("Password rating: \(result)")
//} catch {
  //  print("There was an error.")
//}

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

// Checkpoint 4: Квадратний корінь

// 1. Створюємо перелік можливих помилок
enum RootError: Error {
    case outOfBounds // число менше 1 або більше 10_000
    case noRoot      // цілого кореня немає
}

// 2. Функція з позначкою "throws" (може видати помилку)
func findSquareRoot(of number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw RootError.outOfBounds
    }
    
    // Перебираємо числа від 1 до 100 (бо 100*100 = 10_000)
    for i in 1...100 {
        if i * i == number {
            return i // знайшли корінь!
        }
    }
    
    // Якщо цикл закінчився, а корінь не знайдено
    throw RootError.noRoot
}

// 3. Безпечно тестуємо функцію
let numberToTest = 25 // спробуй потім змінити на -5 або 15

do {
    let result = try findSquareRoot(of: numberToTest)
    print("Квадратний корінь з \(numberToTest) дорівнює \(result)")
} catch RootError.outOfBounds {
    print("Помилка: Число поза межами (від 1 до 10 000).")
} catch RootError.noRoot {
    print("Помилка: Цілого кореня не знайдено.")
} catch {
    print("Невідома помилка.")
}

// Day 8 Challenge: Магія Aura

// Створюємо помилку для гри
enum MagicError: Error {
    case notEnoughMana
}

// Функція чаклування
func castSpell(mana: Int) throws -> String {
    if mana < 10 {
        throw MagicError.notEnoughMana // Кидаємо помилку!
    }
    return "Вогняна куля успішно запущена! 🔥"
}

// Тестуємо (уяви, що в неї всього 5 мани)
do {
    let spellResult = try castSpell(mana: 5)
    print(spellResult)
} catch MagicError.notEnoughMana {
    print("Aura не може чаклувати: замало мани! 💧 потрібно випити зілля.")
} catch {
    print("Щось пішло не так під час чаклування.")
}
