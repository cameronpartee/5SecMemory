import Foundation

struct Slide: Identifiable {
    var id: Int
    var ani: String
    var text: String
}

struct Data {
    var slides = [Slide(id: 1, ani: "9566-lightbulb-bouncing-and-blinking", text: "Welcome to 5 Sec Memory, memory brain training!"),
                  Slide(id: 2, ani: "10282-approval", text: "Memorize as many items as you can and remember spelling counts"),
                  Slide(id: 3, ani: "13491-pop-new-year", text: "Modify your setting to increase your training difficulty level")]
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
