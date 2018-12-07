
import Foundation

class Player {
    var accumScore: Int
    var strikes = 0
    
    init(accumScore: Int) {
        self.accumScore = accumScore
    }
    
    func bowl() {
        let firstBowl = Int.random(in: 0...10)
        
        if firstBowl == 10 {
            self.strikes += 1
            // adds 10 to the other 2 values
            self.accumScore += firstBowl
            let secondBowl = Int.random(in: 0...10)
            self.accumScore += secondBowl
            self.accumScore += 10
            
            let thirdPossibleNum = 10 - secondBowl
            let thirdBowl = Int.random(in: 0...thirdPossibleNum)
            self.accumScore += thirdBowl
            self.accumScore += 10
            
        } else {
            let secondPossibleNum = 10 - firstBowl
            let secondBowl = Int.random(in: 0...secondPossibleNum)
            self.accumScore += firstBowl
            self.accumScore += secondBowl
        }
    }
    
    func playGame() -> Int {
        var count = 0
        let times = 10 - self.strikes * 2
        
        while count < 10 {
            bowl()
            count += 1
        }
        return self.accumScore
    }
}

let playerOne = Player(accumScore: 0)
print("player one total score: \(playerOne.playGame())")
let playerTwo = Player(accumScore: 0)
print("player two total score: \(playerTwo.playGame())")

if playerOne.accumScore > playerTwo.accumScore {
    print("player one beats player two")
} else if playerTwo.accumScore == playerOne.accumScore {
    print("tie!!")
} else {
    print("player two beats player one")
}
