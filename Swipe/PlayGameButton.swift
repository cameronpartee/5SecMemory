import SwiftUI

struct PlayGameButton: View {
    
    @State var showResults = false
    @Binding var filter: Filters
    
    var body: some View {
        NavigationLink(destination: GameView(filter: $filter), isActive: self.$showResults) {
            Button(action: {
                self.showResults = true
            }) {
                HStack {
                    Text("Play Game")
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                }
                .frame(width: 350, height: 40)
                .background(Color.blue)
            }
        }
    }
}

struct PlayGameButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayGameButton(filter: .constant(Filters(timeFilter: 5.0, countFilter: 8.0)))
    }
}
