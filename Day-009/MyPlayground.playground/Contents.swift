import Foundation

var greeting = "Hello, playground"

func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser
greetCopy()

let sayHello = {
    print("Hi there!")
}

sayHello()

let sayHello2 = { (name: String) -> String in
    "Hi \(name)!"
}

sayHello2("Jinx")

// Приклад
//var greetCopy: () -> Void = greetUser

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
//let sortedTeam = team.sorted()
//print(sortedTeam)

//func captainFirstSorted(name1: String, name2: String) -> Bool {
    //if name1 == "Suzanne" {
      //  return true
    //} else if name2 == "Suzanne" {
      //  return false
    //}
    
  //  return name1 < name2
//}

//let captainFirstTeam = team.sorted(by: //captainFirstSorted)
//print(captainFirstTeam)

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})
print(captainFirstTeam)

//  Якщо ви пам'ятаєте, sorted()може приймати будь-яку функцію для виконання власного сортування з одним правилом: ця функція повинна приймати два елементи з відповідного масиву (тут це два рядки) та повертати логічне значення, що дорівнює true, якщо перший рядок має бути відсортований раніше за другий. Щоб було зрозуміло, функція має поводитися саме так – якби вона нічого не повертала або приймала лише один рядок, то Swift відмовився б збирати наш код. Подумайте: у цьому коді функція, яку ми надаємо, sorted()повинна надавати два рядки та повертати логічне значення, тож чому нам потрібно повторювати це в нашому замиканні? Відповідь: нам не потрібно . Нам не потрібно вказувати типи наших двох параметрів, оскільки вони мають бути рядками, і нам не потрібно вказувати тип повернення, оскільки він має бути логічним значенням. Отже, ми можемо переписати код таким чином:

// let captainFirstTeam = team.sorted(by: { name1, name2 in

let captainFirstTeam2 = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
           return true
    } else if name2 == "Suzanne" {
           return false
    }
    
    return name1 < name2
}
print(captainFirstTeam2)

let captainFirstTeam3 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    
    return $0 < $1
}
print(captainFirstTeam3)

// Я залишив цей наостанок, бо він не такий чіткий, як інші – деякі люди бачать цей синтаксис і ненавидять його, бо він менш зрозумілий, і це нормально. Особисто я б не використовував це тут, оскільки ми використовуємо кожне значення більше одного разу, але якби наш sorted()виклик був простішим – наприклад, якби ми просто хотіли виконати зворотне сортування – тоді я б так зробив:

let reverseTeam = team.sorted {
    return $0 > $1
}

let reverseTeam2 = team.sorted { $0 > $1 }

print(reverseTeam2)

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)
