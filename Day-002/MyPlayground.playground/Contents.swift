import Foundation

var greeting = "Hello, playground"

let goodDogs = true
let gameOver = false

let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

var gameOver2 = false
print(gameOver2)

gameOver2.toggle()
print(gameOver2)

let firstPart = "Hello, "
let secondPart = "world!"
let greeting2 = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

let luggageCode = "1" + "2" + "3" + "4" + "5"

let quote = "Then he tapped a sign saying \"Believe\" and walked away."

let name = "Taylor"
let age = "26"
let message = "Hello, my name is \(name) and I'm \(age) years old."

let number = 11
let missionMessage = "Apollo " + String(number) + " landed on the moon."
let missionMessage2 = "Apollo \(number) landed on the moon."

print("5 x 5 is \(5 * 5)")

// MARK: - Checkpoint 1: Конвертер температур
let celsius = 25.0
let fahrenheit = (celsius * 9/5) + 32
print("\(celsius)°C is \(fahrenheit)°F")

// MARK: - Day 2 Challenge: Система досвіду
var currentXP = 80
let xpToLevelUp = 100
currentXP += 35
let canLevelUp = currentXP >= xpToLevelUp
print("Досвід \(currentXP). Чи може підвищити рівень? \(canLevelUp)")

