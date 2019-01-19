import Foundation

// MAP - loops over the collection and applies the same operation on each element.

var numbers: [Int] = [5, 4, 10, 2, 9, 6, 12, 22]

numbers.map { number in number * 10 }
numbers.map {$0 * 10}                       // short hand syntax using $ operator


// FILTER - loops over collection and returns items that match the conditions

numbers.filter { $0 % 2 == 0 }


// REDUCE - loops through collection and operates to a single value from the collection

numbers.reduce(0) {$0 + $1}


var menu: [String: Int] = ["Sushi": 7, "Pad Thai": 13, "Curry": 15]
print(menu.map { (key, value) in return key.capitalized })
print(menu.map { $1 })

var numberArray = [1, 2, 3, 4, 5]
let indexNum = numberArray.enumerated().map { (index, element) in  return " \(index):\(element)" }
print(indexNum)

var menus: [String: Int] = ["Sushi": 7, "Pad Thai": 13, "Curry": 15]
print(menus.filter{ (key, value) in return value >  10 })
print(menus.filter{ $1 > 10 })

var numbersss = [3, 7, 22, 8, 15]
let addedNum = numbersss.reduce( 0, { x, y in x + y })
print(numbersss.reduce(0) { $0 + $1 })
print(numbersss.reduce(0, + ))
print(numbersss.reduce(1, *))
print(addedNum)
var strings = ["h", "a", "p", "p", "y"]
print(strings.reduce("", +))

var menuu = ["Sushi": 7, "Pad Thai": 13, "Curry": 15]
print(menuu.reduce("Famous dishes are: ") { (result, tupleOfKeyAndvalue) in return result + tupleOfKeyAndvalue.key + ", " })
print(menuu.reduce(0) { (result, tupleOfKeyAndValue) in return result + tupleOfKeyAndValue.value })

