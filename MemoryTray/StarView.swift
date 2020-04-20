import SwiftUI

struct StarView: View {
    
    @Binding var rotateAmount: Int
    
    
    var body: some View {
        Image("Star")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 100, height: 100)
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
