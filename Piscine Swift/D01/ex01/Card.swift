import Foundation

func ==(lhs: Card, rhs: Card) -> Bool
{
    return (lhs.color == rhs.color && lhs.value == rhs.value)
}

class Card : NSObject {
    var value: Value
    var color: Color
    
    init(color: Color, value: Value) {
        self.color = color
        self.value = value
    }
    
    override var description: String { return ("\(self.value) ,  \(self.color)")}
    
    override func isEqual(object: AnyObject?) -> Bool
    {
        if object is Card {
           /* let toto: Card*/
            let toto = object as! Card
            return (self == toto)
        }
        else{
            return false}
    }   
}