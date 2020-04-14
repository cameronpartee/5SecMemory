import Foundation


struct Quiz {

    var count: Int
    var isText: Bool
    var isAnimal: Bool
    
    var animals = ["Giraffe", "Cat", "Butterfly", "Dog", "Elephant", "Monkey", "Dove", "Cow"]
    var foods = ["Pancake", "Pizza", "Orange", "Acorn", "Apple", "Doughnut", "Strawberry", "Bread"]
    
    var points: Int
    
    // LeetCode interview question
    mutating func computerScore(a: [String.SubSequence], isAnimal: Bool) {
        for i in a {
            if(isAnimal) {
                if animals.contains(String(i)) {
                    points += 5
                }
            } else {
                if foods.contains(String(i)) {
                    points += 5
                }
            }
        }
    }
}

