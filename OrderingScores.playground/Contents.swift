import UIKit

var globalScores = [(name: String, position: Int, points: Int)]()

func ordenedFirstThirdPlaces(scores: [(String, Int, Int)]) {
    var scores: [(name: String, position: Int, points: Int)] = scores
    
    let minPosition = scores.sorted(by: {$0.position < $1.position})[0].position
    
    for (pos, _) in scores.enumerated() {
        scores[pos].position = pos+minPosition
    }
    
    for (num, _) in scores.enumerated() {
        for item2 in scores {
            if scores[num].points == item2.points {
                scores[num].position = item2.position
                break
            }
        }
    }
    
    scores.sort(by: { $0.points > $1.points })
    
    let thirdPlaces = scores.filter({$0.position < 4})
    acomodatePlacesWithoutTie(scores: thirdPlaces)
}

func acomodatePlacesWithoutTie(scores: [(name: String, position: Int, points: Int)]) {
    var nScores = [(name: String, position: Int, points: Int)]()
    
    for item in scores {
        let tie = scores.contains { provisional -> Bool in
            if item != provisional {
                if provisional.position == item.position {
                    return true
                }
            }
            return false
        }
        
        if !tie {
            globalScores.append(item)
        } else {
            nScores.append(item)
        }
    }
    print("\nglobalScores: \(globalScores)")
    print("\nPlaces to break: \(nScores)")
}

func acomodatePlacesWithTie(scores: [(name: String, position: Int, points: Int)]) {
    var nScores = [(name: String, position: Int, points: Int)]()
    var firstScores = [(name: String, position: Int, points: Int)]()
    var secondScores = [(name: String, position: Int, points: Int)]()
    var thirdScores = [(name: String, position: Int, points: Int)]()
    
    for item in scores {
        switch item.position {
        case 1:
            firstScores.append(item)
        case 2:
            secondScores.append(item)
        case 3:
            thirdScores.append(item)
        default:
            print("default")
        }
    }
    
    firstScores.sort(by: { $0.points > $1.points })
    secondScores.sort(by: { $0.points > $1.points })
    thirdScores.sort(by: { $0.points > $1.points })
    
    for (num, _) in firstScores.enumerated() {
        firstScores[num].position = firstScores[num].position+num
        nScores.append(firstScores[num])
    }
    
    for (num, _) in secondScores.enumerated() {
        secondScores[num].position = secondScores[num].position+num
        nScores.append(secondScores[num])
    }
    
    for (num, _) in thirdScores.enumerated() {
        thirdScores[num].position = thirdScores[num].position+num
        nScores.append(thirdScores[num])
    }
    
    ordenedFirstThirdPlaces(scores: nScores)
}
