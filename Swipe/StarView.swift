import SwiftUI

struct StarView: View {
    
    @Binding var rotateAmount: Int
    
    var body: some View {
        Image("star")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 100, height: 100)
        .shadow(color: Color.black, radius: 3, x: 3, y: 3)
        .rotationEffect(.degrees(Double(rotateAmount)))
        .animation(Animation.easeInOut(duration: 1)
            .repeatForever(autoreverses: true))
    }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        StarView(rotateAmount: .constant(40))
    }
}
