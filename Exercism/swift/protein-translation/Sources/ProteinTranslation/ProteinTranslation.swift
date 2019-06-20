//Solution goes in Sources

enum Err: Error {
    case error
}

class ProteinTranslation {
    
    static let translateDict = ["AUG": "Methionine", "UUU": "Phenylalanine", "UUC": "Phenylalanine", "UUA": "Leucine", "UUG": "Leucine", "UCU": "Serine", "UCC": "Serine", "UCA": "Serine", "UCG": "Serine", "UAU": "Tyrosine", "UAC": "Tyrosine", "UGU": "Cysteine", "UGC": "Cysteine", "UGG": "Tryptophan", "UAA": "STOP", "UAG": "STOP", "UGA": "STOP"]
    
    class func translationOfCodon(_ codon: String) -> String? {
        return translateDict[codon]
    }
    
    class func translationOfRNA(_ rna: String) throws -> [String] {
        
        var proteins = [String]()
        
        guard rna.count > 3 else {
            return proteins
        }
        
        for i in stride(from: 0, to: rna.count, by: 3) {
            
            let index = rna.index(rna.startIndex, offsetBy: i)
            let indexLast = rna.index(rna.startIndex, offsetBy: i + 2)
            let codon = rna[index...indexLast]
           
            
            if translateDict[String(codon)] == "STOP" {
                return proteins
            } else if translateDict[String(codon)] == nil {
                throw Err.error
            }
            proteins.append(translateDict[String(codon)]!)
        }
        
        return proteins
    }
}
