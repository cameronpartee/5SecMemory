import SwiftUI

struct QuestionView: View {
    
    @State var totalTime = 10
    @State var timerIsRunning = true
    @State var showResults = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    var quiz = Quiz(count: 4, isText: false, isAnimal: true, points: 0)
    
    
    var body: some View {
        Text("hey")
        
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
