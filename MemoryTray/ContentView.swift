import SwiftUI

struct ContentView: View {
    
    @State var totalTime = 10
    @State var timerIsRunning = true
    @State var showResults = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    
    @State var quiz = Quiz(count: 8, isAnimal: false, points: 0)
    
    func turnTimerOn() {
        timerIsRunning = true
    }
    
    func setTime() {
        totalTime = 3
    }
    
    func timerLogic() {
        // if timer is running decrement it
        if(totalTime > 0 && timerIsRunning) {
            totalTime -= 1
        } else {
            // do action when timer ends
            showResults = true
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(totalTime).00")
                    .bold()
                    .font(.system(size: 60))
                    .padding(.top, 30)
                    .foregroundColor(Color.blue)
                
                ForEach(0..<quiz.count) { index in
                    if(self.quiz.isAnimal) {
                        Image("\(self.quiz.animals[index])")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else  {
                        Image("\(self.quiz.foods[index])")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                
                NavigationLink(destination: ResultsView(quiz: self.$quiz), isActive: self.$showResults) {
                    Text("")
                }.hidden()
                    .onAppear() {
                        self.turnTimerOn()
                        self.setTime()
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }.onReceive(timer) { _ in
            self.timerLogic()
        }.border(Color.blue, width: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
