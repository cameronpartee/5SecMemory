import Foundation


struct Quiz {

    var time: Int = 10
    var count: Int
    var points: Int
    
    var items = ["Gorilla", "Cow", "Cherry", "Elephant", "Lemon", "Lion", "Apple", "Kangaroo", "Snail", "Watermelon", "Pig", "Strawberry", "Snake", "Mango"]
    
    // LeetCode interview question
    mutating func computerScore(a: [String.SubSequence], count: Int) {
        for i in a {
            if items.contains(String(i.capitalized)) {
                points += Int(((1 / Double(count)) * 100.0))
            }
        }
    }
}

