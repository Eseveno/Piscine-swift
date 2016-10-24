var asTrefle : (Color, Value) = (Color.allColors[1], Value.allValues[12])
print(asTrefle.1, "de" ,asTrefle.0)
let card1 = Card(color : Color.Pique, value : Value.As)
let card2 = Card(color: Color.Carreau, value :Value.Deux)
let card3 = Card(color : Color.Pique, value : Value.As)
print(card1)
print(card2)
print(card2)
print(card1.isEqual(card2))
print(card1 == card3)
print(Deck.allCards)
var deck1 = Deck.allCards
deck1.shuffle()
print(deck1)
print(deck1.count)
var deck2 = Deck(shuffle: true)
print(deck2)
while deck2.cards.count != 0{
    print(deck2.draw())
}
print(deck2.draw())
print("cards", deck2)
print("outs", deck2.outs)
while deck2.outs.count != 0{
    deck2.fold(deck2.outs.first!)
}
print("cards", deck2)
print("outs", deck2.outs)
print("discards", deck2.discards)