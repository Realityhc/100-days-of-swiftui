import Foundation

var greeting = "Hello, playground"

let surname: String = "Lasso"
var score: Int = 0
var score2: Double = 0.0

let playerName: String = "Roy"
var luckynumber: Int = 13
let pi: Double = 3.1419
var isAuthenticated: Bool = true
var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])
var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
var teams: [String] = [String] ()
var cities: [String] = []
var clues = [String] ()

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light

let username: String
// lots of complex logic
username = "@Amo"
// lots more complex logic
print(username)

let seasons = ["Spring", "Summer", "Autumn", "Winter"]
seasons.count
let uniqueSeasons = Set(seasons)
print(uniqueSeasons.count)

// MARK: - Day 4 Challenge: Щоденник мандрівниці Aura
var visitedLocations: [String] = ["Рідне селище", "Ліс слаймів"]
visitedLocations.append("Темна печера")
var foundArtifacts: Set<String> = ["Кристал мани", "Старий амулет", "Кристал мани"]
print("Aura відвідала \(visitedLocations.count) локації та знайшла \(foundArtifacts.count) унікальних артефактів")
