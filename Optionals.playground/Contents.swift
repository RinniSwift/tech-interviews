

extension String {
    var fileExtension: Substring? {
        var periodIndex: String.Index? = nil
        // can be improved with another extension. `Contains()` -> (bool, String.Index)
        for (ind,char) in self.enumerated() {
            if char == "." {
                periodIndex = self.index(self.startIndex, offsetBy: ind)
            }
        }
        if periodIndex == nil {
            return nil
        }
        let extensionRange = self.index(after: periodIndex!)..<self.endIndex
        return self[extensionRange]
    }
}

"rinni@makeschool.com".fileExtension


