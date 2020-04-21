import SwiftUI

struct QuizView: View {
    
    @State private var quiz = Quiz(points: 0)
    @State private var totalTime = 5
    @State private var timerIsRunning = true
    @State private var showResults = false
    @Binding var filter: Filter
    
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
                
                Text("\(self.totalTime).00")
                    .font(.system(size: 60))
                HStack {
                    VStack {
                        ForEach(0..<Int(self.filter.countFilter)) { index in
                            if(index % 2 == 0) {
                                Image("\(self.quiz.items[index])")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 110, height: 90)
                            }
                        }
                    }.padding(.trailing, 20)
                    VStack {
                        ForEach(0..<Int(self.filter.countFilter)) { index in
                            if(index % 2 == 1) {
                                Image("\(self.quiz.items[index])")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 110, height: 90)
                            }
                        }
                    }.padding(.leading, 20)
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
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .background(Color(0xd3995f))
        .border(Color(0x663603), width: 3)
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(filter: .constant(Filter(timeFilter: 9.0, countFilter: 10.0)))
    }
}
