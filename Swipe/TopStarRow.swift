import SwiftUI

struct TopStarRow: View {
    
    @Binding var quiz: Quiz
    @Binding var rotateAmount: Int
    
    var body: some View {
        HStack {
            StarView(rotateAmount: self.$rotateAmount)
            StarView(rotateAmount: self.$rotateAmount).opacity(self.quiz.points >= 20 ? 1 : 0)
            StarView(rotateAmount: self.$rotateAmount).opacity(self.quiz.points >= 40 ? 1 : 0)
        }
    }
}

struct TopStarRow_Previews: PreviewProvider {
    static var previews: some View {
        TopStarRow(quiz: .constant(Quiz(points: 0)), rotateAmount: .constant(100))
    }
}
