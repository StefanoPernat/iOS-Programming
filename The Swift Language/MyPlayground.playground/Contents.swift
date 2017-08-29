//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
str = "Hello, Swift"

let constStr = str
//constStr = "Hello, world"

// type annotations
var nextYear: Int
var bodyTemp: Float
var hasPet: Bool

// Collections types
var arrayOfInts: [Int]  // shorthand sintax, real syntax: var arrayOfInts: Array<Int>
var dictionaryOfCapitalsByCountry: [String: String] // shorthand sintax, real syntax: var dictionaryOfCapitalsByCountry: Dictionary<String, String>
var winningLotteryNumbers: Set<Int>

let number = 42
let fmStation = 91.1

var countingUp = ["one", "two"]
let nameByParkingSpace = [13: "Alice", 27: "Bob"]

let secondElement = countingUp[1]

// initializers
let emptyString = String()
let emptyArrayOfInts = [Int]()
let emptySetOfFloats = Set<Float>()

let defaultNumber = Int()
let defaultBool = Bool()

let meaningOfLife = String(number)

let availableRooms: Set<Int> = [205, 411, 412]

let defaultFloat = Float()
let floatFromLiteral = Float(3.14)

let easyPi = 3.14
let floatFromDouble = Float(easyPi)
let floatingPi: Float = 3.14

// properties
countingUp.count
emptyString.isEmpty
countingUp.append("three")

// optionals
var reading1: Float?
var reading2: Float?
var reading3: Float?

reading1 = 9.8
reading2 = 9.2
reading3 = 9.7

// force unwrapping
let avgReading = (reading1! + reading2! + reading3!) / 3

// optional binding
if let r1 = reading1, let r2 = reading2, let r3 = reading3 {
    let avgReading = (r1 + r2 + r3) / 3
} else {
    let errorString = "Instrument reported a reading that was nil."
}

// subscripting dictionaries is always an optional
let space13Assignee = nameByParkingSpace[13]
let space42Assignee: String? = nameByParkingSpace[42]

if let space27Assignee = nameByParkingSpace[27] {
    print("Key 27 is assigned in the dictionary")
}

// Loops and String interpolation
let range = 0..<countingUp.count
for i in range {
    print(countingUp[i])
}

for string in countingUp {
    print(string)
}

for (pos, string) in countingUp.enumerated() {
    print("\(pos): \(string)")
}

for (parkingSpace, name) in nameByParkingSpace {
    print("\(parkingSpace) is assigned to \(name)")
}

enum PieType: Int {
    case apple = 0
    case cherry
    case pecan
}

let favouritePie = PieType.apple

let name: String
switch favouritePie {
case .apple:
    name = "Apple"
case .cherry:
    name = "Cherry"
case .pecan:
    name = "Pecan"
}

let pieRawValue = PieType.pecan.rawValue
if let pieType = PieType(rawValue: 9) {
    print(pieType)
}
