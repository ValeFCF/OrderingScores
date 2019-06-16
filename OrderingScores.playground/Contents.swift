import UIKit

var globalScores = [(name: String, position: Int, points: Int)]()

func ordenedFirstThirdPlaces(scores: [(String, Int, Int)], empate: Bool) {
    var scores: [(name: String, position: Int, points: Int)] = scores
    
    var minPosition = 0
    var count = 1
    
    while minPosition < scores.count-1 {
        for num in minPosition+1 ... scores.count-1 {
            
            let initialPosition = scores[num].position
            
            if scores[minPosition].position == scores[num].position {
                if scores[minPosition].points != scores[num].points {
                    if !empate {
                        scores[num].position = scores[num].position+minPosition
                    } else {
                        scores[num].position = scores[num].position+count
                    }
                }
            } else {
                if scores[minPosition].points == scores[num].points {
                    if !empate {
                        scores[num].position = scores[minPosition].position
                    }
                }
            }
            
            if empate {
                if initialPosition == scores[num].position {
                    count = count+1
                }
            }
        }
        minPosition = minPosition+1
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

let scoreIni = [(name: "vale1", position: 1, points: 8),
                (name: "vale2", position: 2, points: 8),
                (name: "vale3", position: 3, points: 5),
                (name: "vale4", position: 4, points: 5),
                (name: "vale5", position: 5, points: 5),
                (name: "vale6", position: 6, points: 4),
                (name: "vale7", position: 7, points: 4)]

//ordenedFirstThirdPlaces(scores: scoreIni, empate: false)

let tie1 =  [(name: "vale1", position: 1, points: 8),
             (name: "vale2", position: 1, points: 8),
             (name: "vale3", position: 3, points: 5),
             (name: "vale4", position: 3, points: 5),
             (name: "vale5", position: 3, points: 5),
             (name: "vale6", position: 3, points: 5)]

//ordenedFirstThirdPlaces(scores: tie1, empate: true)

let tie2 = [(name: "vale1", position: 1, points: 5),
            (name: "vale2", position: 1, points: 5),
            (name: "vale3", position: 3, points: 5),
            (name: "vale4", position: 3, points: 5),
            (name: "vale5", position: 3, points: 5),
            (name: "vale6", position: 3, points: 5)]

//ordenedFirstThirdPlaces(scores: tie2, empate: true)

let tie3 = [(name: "vale1", position: 1, points: 5),
            (name: "vale2", position: 1, points: 5),
            (name: "vale3", position: 3, points: 7),
            (name: "vale4", position: 3, points: 7),
            (name: "vale5", position: 3, points: 7),
            (name: "vale6", position: 3, points: 7)]

//ordenedFirstThirdPlaces(scores: tie3, empate: true)

let tie4 = [(name: "vale1", position: 1, points: 6),
           (name: "vale2", position: 1, points: 5),
           (name: "vale3", position: 3, points: 8),
           (name: "vale4", position: 3, points: 7),
           (name: "vale5", position: 3, points: 7),
           (name: "vale6", position: 3, points: 7)]

//ordenedFirstThirdPlaces(scores: tie4, empate: true)
