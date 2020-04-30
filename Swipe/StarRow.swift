import SwiftUI

struct StarRow: View {
    
    @Binding var quiz: Quiz
    @Binding var rotateAmount: Int
    
    var body: some View {
        HStack {
            StarView(rotateAmount: self.$rotateAmount).opacity(self.quiz.points >= 60 ? 1 : 0)
            StarView(rotateAmount: self.$rotateAmount).opacity(self.quiz.points >= 80 ? 1 : 0)
            StarView(rotateAmount: self.$rotateAmount).opacity(self.quiz.points >= 95 ? 1 : 0)
        }
    }
}

struct StarRow_Previews: PreviewProvider {
    static var previews: some View {
        StarRow(quiz: .constant(Quiz(points: 0)), rotateAmount: .constant(100))
    }
}
