import SwiftUI

struct ScoreLabel: View {
    
    @Binding var quiz: Quiz
    
    var body: some View {
        Text("\(self.quiz.points)")
            .font(.system(size: 130))
            .italic()
            .padding()
    }
}

struct ScoreLabel_Previews: PreviewProvider {
    static var previews: some View {
        ScoreLabel(quiz: .constant(Quiz(points: 0)))
    }
}
