import Foundation

var greeting = "Hello, playground!"
let character = "Daphne"
var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

let actor = "Danzel Washington"
let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"
let movie = """
A day in
the life of an
Apple engineer
"""
let quote = "Then he tapped a sign saying \"Believe\" and walked away."

print(actor.count)
let nameLength = actor.count
print(nameLength)

print(result.uppercased())
print(movie.hasPrefix("A day"))
print(filename.hasSuffix(".jpg"))

let score = 10
let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2
print(score)
print(squaredScore)

var counter = 10
counter += 5
print(counter)

counter *= 2
print(counter)
counter -= 10
print(counter)
counter /= 2
print(counter)

let number = 120
print(number.isMultiple(of: 3))
print(120.isMultiple(of: 3))

let numBer = 0.1 + 0.2
print(numBer)

let a = 1
let b = 2.0
let c = a + Int(b)

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

var rating = 5.0
rating *= 2

// MARK: - Експерименти

let charactername = "Aura"
let characterMaxHealth: Int = 100
var characterCurrentHealth: Int = 100

print("Героїня \(charactername) має \(characterCurrentHealth)/\(characterMaxHealth) здоров'я.")

characterCurrentHealth -= 15

print("Після атаки слайма \(charactername) має \(characterCurrentHealth)/\(characterMaxHealth) здоров'я.")
