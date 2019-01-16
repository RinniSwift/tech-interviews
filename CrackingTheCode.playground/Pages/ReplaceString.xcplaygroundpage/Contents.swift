/*
 
 replace spaces in a string with "%20"
 
 */

func replaceSpace(string: String) -> String {
    
    var result = ""
    for letter in string {
        if letter == " " {
            result += "%20"
        } else {
            result += String(letter)
        }
    }
    return result
}

replaceSpace(string: "Rinni likes spinnach")
