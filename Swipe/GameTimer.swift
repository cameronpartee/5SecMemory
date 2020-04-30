import SwiftUI

struct GameTimer: View {
    
    @Binding var totalTime: Int
    
    var body: some View {
        Text("\(self.totalTime).00")
            .font(.system(size: 60))
    }
}

struct GameTimer_Previews: PreviewProvider {
    static var previews: some View {
        GameTimer(totalTime: .constant(5))
    }
}
