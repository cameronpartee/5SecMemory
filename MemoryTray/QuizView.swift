import SwiftUI

struct QuizView: View {
    
    @State private var quiz = Quiz(points: 0)
    @State private var totalTime = 5
    @State private var timerIsRunning = true
    @State private var showResults = false
    @Binding var filter: Filter
    
    // needed to dismiss view
    @Environment(\.presentationMode) var presentationMode
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    
    func timerLogic() {
        if(totalTime > 0 && timerIsRunning) {
            totalTime -= 1
        } else {
            showResults = true
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Text("\(self.totalTime).00")
                        .font(.system(size: 60))
                    Text("Reset Game")
                        .bold()
                        .font(.system(size: 15))
                        .foregroundColor(Color.blue)
                        .onTapGesture {
                            // dismiss view
                            self.presentationMode.wrappedValue.dismiss()
                    }
                }
                HStack {
                    VStack {
                        ForEach(0..<Int(self.filter.countFilter)) { index in
                            if(index % 2 == 0) {
                                Image("\(self.quiz.items[index])")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 130)
                            }
                        }
                    }.padding(.trailing, 10)
                    VStack {
                        ForEach(0..<Int(self.filter.countFilter)) { index in
                            if(index % 2 == 1) {
                                Image("\(self.quiz.items[index])")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 130)
                            }
                        }
                    }.padding(.leading, 10)
                }
                
                NavigationLink(destination: ResultsView(quiz: self.$quiz, filter: self.$filter).navigationBarTitle("")
                    .navigationBarHidden(true)
                ,isActive: self.$showResults) {
                    Text("")
                }.hidden()
                    .onAppear() {
                        self.timerIsRunning = true
                        self.totalTime = Int(self.filter.timeFilter)
                }
            }
            .onReceive(self.timer) { _ in
                self.timerLogic()
            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(filter: .constant(Filter(timeFilter: 5.0, countFilter: 8.0)))
    }
}
