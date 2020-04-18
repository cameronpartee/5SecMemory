import SwiftUI

struct ResultsView: View {
    
    @Binding var quiz: Quiz
    @State var inputText = ""
    @State var rotateAmount = 0
    @State var showElements = false
    @State var showStar = false
    @Environment(\.presentationMode) var presentationMode
    
    //@State var points = 0
    
    func getInputText() {
        let text = inputText
        let textArray = text.split(separator: " ")
        quiz.computerScore(a: textArray, isAnimal: quiz.isAnimal, count: quiz.count)
        //points = quiz.points
        print(quiz.points)
    }
    
    func rotateStars() {
        rotateAmount += 180
    }
    
    func showUIElements() {
        showElements = true
    }
    
    func calculateScore() {
        
    }
    
    var body: some View {
        VStack {
            
            TextField("Enter text here", text: $inputText).font(.system(size: 30))
                .padding()
                .border(Color.blue, width: 1)
            Text("Submit Quiz")
                .font(.system(size: 30))
                .padding()
                .border(Color.blue, width: 1)
                .onTapGesture {
                    self.getInputText()
                    self.showUIElements()
                    self.rotateStars()
            }
            Text("Play Again")
                .font(.system(size: 30))
                .padding()
                .border(Color.blue, width: 1)
                .padding()
                .onTapGesture {
                    self.quiz.points = 0
                    self.presentationMode.wrappedValue.dismiss()
            }.opacity(showElements ? 1 : 0)
            
            Spacer()
            
            HStack {
                Image("Star")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(Double(rotateAmount)))
                    .animation(Animation.easeInOut(duration: 1)
                        .repeatForever(autoreverses: true))
                Image("Star")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(Double(rotateAmount)))
                    .animation(Animation.easeInOut(duration: 1)
                        .repeatForever(autoreverses: true))
                    .opacity(quiz.points >= 20 ? 1 : 0)
                Image("Star")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(Double(rotateAmount)))
                    .animation(Animation.easeInOut(duration: 1)
                        .repeatForever(autoreverses: true))
                    .opacity(quiz.points >= 40 ? 1 : 0)
            }.opacity(showElements ? 1 : 0)
            
            VStack {
                Text("\(quiz.points)")
                    .font(.system(size: 130))
                    .italic()
                    .padding()
                    .onTapGesture {
                        self.getInputText()
                }.opacity(showElements ? 1 : 0)
                Text("points!")
                    .font(.system(size: 30))
                    .bold()
                    .italic()
                    .padding()
                    .onTapGesture {
                        self.getInputText()
                }.opacity(showElements ? 1 : 0)
                
                HStack {
                    Image("Star")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .rotationEffect(.degrees(Double(rotateAmount)))
                        .animation(Animation.easeInOut(duration: 1)
                            .repeatForever(autoreverses: true))
                        .opacity(quiz.points >= 60 ? 1 : 0)
                    Image("Star")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .rotationEffect(.degrees(Double(rotateAmount)))
                        .animation(Animation.easeInOut(duration: 1)
                            .repeatForever(autoreverses: true))
                        .opacity(quiz.points >= 80 ? 1 : 0)
                    Image("Star")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .rotationEffect(.degrees(Double(rotateAmount)))
                        .animation(Animation.easeInOut(duration: 1)
                            .repeatForever(autoreverses: true))
                        .opacity(quiz.points >= 95 ? 1 : 0)
                }.opacity(showElements ? 1 : 0)
            }.offset(y: -50)
            
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(quiz: .constant(Quiz(count: 4, isText: false, isAnimal: true, points: 0)))
    }
}
