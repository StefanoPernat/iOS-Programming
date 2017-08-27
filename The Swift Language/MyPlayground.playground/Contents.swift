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