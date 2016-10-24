let card1 = Card(color : Color.Carreau, value : Value.Valet)
print(card1)
let card2 = Card(color : Color.Pique, value: Value.Cinq)
print(card2)
print(card1 == card2)

let a = Card(color: Color.Pique, value: Value.Huit)
let b = Card(color: Color.Pique, value: Value.Huit)
let c = Card(color: Color.Coeur, value: Value.Huit)
let d = "aa"

print(a.description)
print(a)
print(a == b)
print(a == c)
print(a.isEqual(d))
print(a.isEqual(b))
print(a.isEqual(c))