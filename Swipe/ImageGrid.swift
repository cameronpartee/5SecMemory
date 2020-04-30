
import SwiftUI

struct ImageGrid: View {
    
    @Binding var quiz: Quiz
    @Binding var filter: Filters
    
    var body: some View {
        HStack {
            VStack {
                ForEach(0..<Int(self.filter.countFilter)) { index in
                    if(index % 2 == 0) {
                        Image("\(self.quiz.items[index])")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 110)
                    }
                }
            }.padding(.trailing, 10)
            VStack {
                ForEach(0..<Int(self.filter.countFilter)) { index in
                    if(index % 2 == 1) {
                        Image("\(self.quiz.items[index])")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 110)
                    }
                }
            }.padding(.leading, 10)
        }
    }
}

struct ImageGrid_Previews: PreviewProvider {
    static var previews: some View {
        ImageGrid(quiz: .constant(Quiz(points: 0)), filter: .constant(Filters(timeFilter: 5.0, countFilter: 8.0)))
    }
}
