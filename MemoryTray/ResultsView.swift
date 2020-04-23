import SwiftUI

struct ResultsView: View {
    
    @State private var inputText = ""
    @State private var rotateAmount = 0
    @State private var showElements = false
    @State private var showStar = false
    @Binding var quiz: Quiz
    @Binding var filter: Filter
    
    // needed to dismiss view
    @Environment(\.presentationMode) var presentationMode
    
    func showUIElements() {
        showElements = true
    }
    
    func getInputText() {
        let text = inputText
        let textArray = text.split(separator: " ")
        quiz.computerScore(a: textArray, count: Int(filter.countFilter))
        print(quiz.points)
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                TextField("Submit answer", text: self.$inputText).font(.system(size: 30))
                    .padding()
                    .border(Color(0x663603), width: 3)
                    .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text("Calculate Score")
                    .font(.system(size: 30))
                    .padding()
                    .border(Color(0x663603), width: 3)
                    .onTapGesture {
                        self.getInputText()
                        self.showUIElements()
                        self.rotateAmount += 180
                }
                Text("Play Again")
                    .font(.system(size: 30))
                    .padding()
                    .border(Color(0x663603), width: 3)
                    .padding()
                    .onTapGesture {
                        // reset the points and dismiss
                        self.quiz.points = 0
                        self.presentationMode.wrappedValue.dismiss()
                }.opacity(self.showElements ? 1 : 0)
                
                Spacer()
                
                HStack {
                    StarView(rotateAmount: self.$rotateAmount)
                    StarView(rotateAmount: self.$rotateAmount).opacity(self.quiz.points >= 20 ? 1 : 0)
                    StarView(rotateAmount: self.$rotateAmount).opacity(self.quiz.points >= 40 ? 1 : 0)
                }.opacity(self.showElements ? 1 : 0)
                
                VStack {
                    Text("\(self.quiz.points)")
                        .font(.system(size: 130))
                        .italic()
                        .padding()
                        .onTapGesture {
                            self.getInputText()
                    }.opacity(self.showElements ? 1 : 0)
                    Text("points!")
                        .font(.system(size: 30))
                        .bold()
                        .italic()
                        .padding()
                        .onTapGesture {
                            self.getInputText()
                    }.opacity(self.showElements ? 1 : 0)
                    
                    HStack {
                        StarView(rotateAmount: self.$rotateAmount).opacity(self.quiz.points >= 60 ? 1 : 0)
                        StarView(rotateAmount: self.$rotateAmount).opacity(self.quiz.points >= 80 ? 1 : 0)
                        StarView(rotateAmount: self.$rotateAmount).opacity(self.quiz.points >= 95 ? 1 : 0)
                    }.opacity(self.showElements ? 1 : 0)
                }.offset(y: -50)
            }
        }.background(Color(0xd3995f))
            .border(Color(0x663603), width: 6)
        
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(quiz: .constant(Quiz(points: 0)), filter: .constant(Filter(timeFilter: 9.0, countFilter: 10.0)))
    }
}
