import Foundation

struct Slide: Identifiable {
    var id: Int
    var ani: String
    var text: String
}

struct Data {
    var slides = [Slide(id: 1, ani: "9566-lightbulb-bouncing-and-blinking", text: "Welcome to 5Second Memory, the worlds best memory brain training game!"),
                  Slide(id: 2, ani: "10282-approval", text: "Memorize as many items as you can, remember that spelling items correctly counts."),
                  Slide(id: 3, ani: "13491-pop-new-year", text: "Modify the game setting to memorize more or less items with more or less time.")]
}

struct Filters {
    var timeFilter: Float
    var countFilter: Float
}

struct Quiz {

    var points: Int
    var items = ["apple", "butterfly", "giraffe", "hippopotamus", "knife", "heart", "cat", "shoe", "whale", "star", "dog", "pear", "pizza", "onion", "steak", "broccoli", "bacon"]
    
    mutating func computerScore(a: [String.SubSequence], count: Int) {
        for i in a {
            if items.contains(String(i.lowercased())) {
                points += Int(((1 / Double(count)) * 100.0))
            }
        }
    }
}
