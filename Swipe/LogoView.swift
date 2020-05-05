import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack {
            Text("5Second")
            .italic()
            .font(.system(size: 30))
            Text("Memory")
            .bold()
            .font(.system(size: 30))
        }
         
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
