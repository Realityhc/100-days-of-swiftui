import Foundation

var greeting = "Hello, playground"

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os)")
}

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

for i in 1...12 {
    print("The \(i) times table:")
    
    for j in 1...12 {
        print("  \(j) x \(i) is \(j * i)")
    }
    
    print("")
}

for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

print()

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)

var countdown = 10

while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")

let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

// створити ціле число для зберігання нашого ролу
var roll = 0

// продовжуйте цикл, поки не досягнемо 20
while roll != 20 {
    // киньте новий кубик і напишіть, що вийшло
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

// Якщо ми тут, це означає, що цикл закінчився – у нас вийшло 20!
print("Critical hit!")

var number: Int = 10
while number > 0 {
    number -= 2
    if number.isMultiple(of: 2) {
        print("\(number) is an even number.")
    }
}

var position = 5
while position > 0 {
    print("\(position)!")
    position -= 1
}

var averageScore = 2.5
while averageScore < 15.0 {
    averageScore += 2.5
    print("The average score is \(averageScore)")
}

var speed = 50
while speed <= 55 {
    print("Accelerating to \(speed)")
    speed += 1
}

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)

// let number3 = 3
// let number5 = 5
// var multiples2: [Int] = [100]

// for i in 1...100 {
   //  if i.isMultiple(of: number3) && i.isMultiple(of: number5) {
      //   print("Fizz")
    //}
    
   // if i.isMultiple(of: number3) {
     //   print("Fizz")
    //}
    
   // if i.isMultiple(of: number5) {
     //   print("Buzz")
    //}
//}

//print(multiples2)

// 1. Створюємо цикл від 1 до 100 (ти зробив це ідеально!)
for i in 1...100 {
    
    // 2. СПОЧАТКУ перевіряємо найсуворішу умову (кратне і 3, і 5)
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
    }
    // 3. Якщо перше не підійшло, перевіряємо тільки на 3
    else if i.isMultiple(of: 3) {
        print("Fizz")
    }
    // 4. Якщо і це не підійшло, перевіряємо тільки на 5
    else if i.isMultiple(of: 5) {
        print("Buzz")
    }
    // 5. Якщо жодна умова не виконалася (наприклад, число 2 або 4)
    else {
        // просто друкуємо саме число!
        print(i)
    }
}

// day 6 challenge: епічна битва!

var slimeHealth = 30
let auraDamage = 10
while slimeHealth > 0 {
    slimeHealth -= auraDamage
    print("aura завдає удару! у слайма залишилося \(slimeHealth) hp")
}

print("слайма переможено! 🎉.")
