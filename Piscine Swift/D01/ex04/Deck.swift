import Foundation

class Deck: NSObject {
    static let allSpades : [Card] = Value.allValues.map{Card(color : Color.Pique, value : $0)}
    static let allDiamonds : [Card] = Value.allValues.map{Card(color : Color.Carreau, value : $0)}
    static let allClubs : [Card] = Value.allValues.map{Card(color : Color.Trefle, value : $0)}
    static let allHearts : [Card] = Value.allValues.map{Card(color : Color.Coeur, value : $0)}
    static let allCards : [Card] = allSpades + allDiamonds + allClubs + allHearts
    
    var cards : [Card]
    var discards : [Card]
    var outs : [Card]
    
    init(shuffle: Bool){
        cards = Deck.allCards
        discards = []
        outs = []
        if shuffle == true {
            cards.shuffle()
        }
    }
    
    override var description: String {
        return String(cards.map{$0.description})
    }
    
    func draw() -> Card? {
        if cards.count == 0{
            return nil
        }
        outs.append(cards.first!)
        cards.removeFirst()
        return outs.last
    }
    
    func fold(c: Card){
        if outs.contains(c){
            discards.insert(c, atIndex: 0)
            outs.removeAtIndex(outs.indexOf(c)!)
        }
    }
    
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