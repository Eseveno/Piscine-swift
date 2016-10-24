import Foundation

class Deck : NSObject{
    
	static let allSpades : [Card] = Value.allValues.map{Card(color : Color.Pique, value : $0)}
	static let allDiamonds : [Card] = Value.allValues.map{Card(color : Color.Carreau, value : $0)}
	static let allClubs : [Card] = Value.allValues.map{Card(color : Color.Trefle, value : $0)}
	static let allHearts : [Card] = Value.allValues.map{Card(color : Color.Coeur, value : $0)}

	static let allCards:[Card] = allSpades+allDiamonds+allHearts+allClubs
}

extension Array {
    mutating func shuffle(){
        for _ in 0 ..< 100 {
            let n = Int(arc4random_uniform(UInt32(self.count)))
            self.append(self[n])
            self.removeAtIndex(n)
            
        }
    }
}