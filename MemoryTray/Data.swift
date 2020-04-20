import Foundation


struct Quiz {

    var count: Int
    var isAnimal: Bool
    
    var animals = ["Giraffe", "Cat", "Butterfly", "Dog", "Elephant", "Monkey", "Dove", "Cow"]
    var foods = ["Pancake", "Pizza", "Orange", "Acorn", "Apple", "Doughnut", "Strawberry", "Bread"]
    
    var points: Int
    
    // LeetCode interview question
    mutating func computerScore(a: [String.SubSequence], isAnimal: Bool, count: Int) {
        for i in a {
            if(isAnimal) {
                if animals.contains(String(i.capitalized)) {
                    points += Int(((1 / Double(count)) * 100.0))
                }
            } else {
                if foods.contains(String(i.capitalized)) {
                    points += Int(((1 / Double(count)) * 100.0))
                }
            }
        }
    }
}

