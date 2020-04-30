import Foundation

struct Slide: Identifiable {
    var id: Int
    var ani: String
    var text: String
}

struct Data {
    var slides = [Slide(id: 1, ani: "9566-lightbulb-bouncing-and-blinking", text: "Train your brain in a fun way"),
                  Slide(id: 2, ani: "10282-approval", text: "Memorize as many items as you can, spelling counts"),
                  Slide(id: 3, ani: "13491-pop-new-year", text: "Modify the setting to your liking")]
}

struct Filters {
    var timeFilter: Float
    var countFilter: Float
}

struct Quiz {

    var points: Int
    var items = ["apple", "butterfly", "giraffe", "hippopotamus", "knife", "heart", "cat", "shoe", "whale", "star", "dog"]
    
    mutating func computerScore(a: [String.SubSequence], count: Int) {
        for i in a {
            if items.contains(String(i.lowercased())) {
                points += Int(((1 / Double(count)) * 100.0))
            }
        }
    }
}
