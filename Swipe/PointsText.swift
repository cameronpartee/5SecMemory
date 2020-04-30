import SwiftUI

struct PointsText: View {
    var body: some View {
        Text("points!")
            .font(.system(size: 30))
            .bold()
            .italic()
            .padding()
    }
}

struct PointsText_Previews: PreviewProvider {
    static var previews: some View {
        PointsText()
    }
}
