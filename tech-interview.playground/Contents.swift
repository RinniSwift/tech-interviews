

/* Nov.5.18
 
 question 1) list the values in an array that are contain the exact order in the other array.
 question 2) given an array of numbers. get the second largest number.
 
*/

let str1 = ["a", "b", "c", "f", "h", "w", "g", "k"]
let str2 = ["c", "f", "d", "h", "w", "g", "k"]

func findLongestConsecutives(str1: [String], str2: [String]) -> [String] {
    var result = [(s: String, i: Int, j: Int)]()
    for (i, a) in str1.enumerated() {
        for (j, b) in str2.enumerated() {
            if a == b {
                if result.count == 0 {
                    result.append((a, i ,j))
                } else {
                    let last = result.last!
                    if last.j == j - 1 && last.i == i - 1 {
                        result.append((a, i, j))
                    } // else create a new array for a new match
                }
            }
        }
    }
    return result.map({ (a) -> String in
        return a.s
    })
}
print(findLongestConsecutives(str1: str1, str2: str2))

// this has a run time of ( n * m ) * z
// n is the for loop , m is the nested for loop, and z is the result array.


