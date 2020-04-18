import SwiftUI

struct ContentView: View {

    @State var totalTime = 3
    @State var timerIsRunning = true
    @State var showResults = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    @State var quiz = Quiz(count: 4, isText: false, isAnimal: true, points: 0)
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("\(totalTime).00").bold().font(.system(size: 60)).padding(.top, 30).foregroundColor(Color.blue)
                
                ForEach(0..<quiz.count) { index in
                    if(self.quiz.isText) {
                        if(self.quiz.isAnimal) {
                            Text("\(self.quiz.animals[index])")
                        } else  {
                            Text("\(self.quiz.foods[index])")
                        }
                    } else {
                        if(self.quiz.isAnimal) {
                            Image("\(self.quiz.animals[index])")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(30)
                        } else  {
                            Image("\(self.quiz.foods[index])")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                        }
                    }
                }
                
                NavigationLink(destination: ResultsView(quiz: self.$quiz), isActive: self.$showResults) {
                  Text("")
                }.hidden()
                .onAppear() {
                    self.timerIsRunning = true
                    self.totalTime = 3
                }
            }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        }.onReceive(timer) { _ in
            if(self.totalTime > 0 && self.timerIsRunning) {
                self.totalTime -= 1
            } else {
                self.showResults = true
            }
        }.border(Color.blue, width: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
