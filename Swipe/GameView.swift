import SwiftUI

struct GameView: View {
    
    @State private var quiz = Quiz(points: 0)
    @State private var totalTime = 5
    @State private var timerIsRunning = true
    @State private var showResults = false
    @Binding var filter: Filters
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    
    func timerLogic() {
        if(totalTime > 0 && timerIsRunning) {
            totalTime -= 1
        } else {
            showResults = true
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(0xF4BFCC).edgesIgnoringSafeArea(.all)
            VStack {
                GameTimer(totalTime: $totalTime)
                ImageGrid(quiz: $quiz, filter: $filter)
                
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

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(filter: .constant(Filters(timeFilter: 5.0, countFilter: 8.0)))
    }
}
