import SwiftUI
import StoreKit

struct ResultsView: View {
    
    @State private var inputText = ""
    @State private var rotateAmount = 0
    @State private var showElements = false
    @State private var showStar = false
    @State private var playCount = UserDefaults.standard.integer(forKey: "count")
    @Binding var quiz: Quiz
    @Binding var filter: Filters
    
    // needed to dismiss view
    @Environment(\.presentationMode) var presentationMode
    
    func getInputText() {
        let text = inputText
        let textArray = text.split(separator: " ")
        quiz.computerScore(a: textArray, count: Int(filter.countFilter))
        print(quiz.points)
    }
    
    var body: some View {
        ZStack { 
            Color(0xF4BFCC).edgesIgnoringSafeArea(.all)
            VStack {
                TextField("Submit answer", text: self.$inputText).font(.system(size: 25))
                    .padding()
                    .border(Color.black, width: 1)
                ResultsText(text: "Calculate Score")
                    .onTapGesture {
                        self.getInputText()
                        self.showElements = true
                        self.rotateAmount += 180
                }
                ResultsText(text: "Play Again")
                    .onTapGesture {
                        self.quiz.points = 0
                        self.playCount += 1
                        // for storekit reviews
                        UserDefaults.standard.set(self.playCount, forKey: "count")
                        self.presentationMode.wrappedValue.dismiss()
                        if(self.playCount % 3 == 0) {
                          SKStoreReviewController.requestReview()
                        }
                }.opacity(self.showElements ? 1 : 0)
                
                Spacer()
                
                TopStarRow(quiz: $quiz, rotateAmount: $rotateAmount)
                    .opacity(self.showElements ? 1 : 0)
                
                VStack {
                    ScoreLabel(quiz: $quiz)
                        .opacity(self.showElements ? 1 : 0)
                    PointsText()
                        .opacity(self.showElements ? 1 : 0)
                    
                    StarRow(quiz: $quiz, rotateAmount: $rotateAmount)
                        .opacity(self.showElements ? 1 : 0)
                }.offset(y: -50)
            }
        }        
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(quiz: .constant(Quiz(points: 0)), filter: .constant(Filters(timeFilter: 9.0, countFilter: 10.0)))
    }
}
