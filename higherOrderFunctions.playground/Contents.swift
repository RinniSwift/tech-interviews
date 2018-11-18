import Foundation

// MAP - loops over the collection and applies the same operation on each element.

var numbers: [Int] = [5, 4, 10, 2, 9, 6, 12, 22]

numbers.map { number in number * 10 }
numbers.map {$0 * 10}                       // short hand syntax using $ operator


// FILTER - loops over collection and returns items that match the conditions

numbers.filter { $0 % 2 == 0 }


// REDUCE - loops through collection and operates to a single value from the collection

numbers.reduce(0) {$0 + $1}


