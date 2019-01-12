/*
 
 Given a string, check if all the characters in the string are unique
 
 */

func uniqueChar(name: String) -> Bool {
    var temp = name
    for (index, item) in temp.enumerated() {
        temp.remove(at: temp.index(of: item)!)
        if temp.contains(item) {
            return false
        }
    }
    return true
}

uniqueChar(name: "aldreb")
