import SwiftUI

struct ItemView: View {
    
    var ani: String
    var text: String
    
    var body: some View {
        VStack {
            AniView(text: ani)
                .frame(width: 400, height: 300)
            Text(text)
                .font(.system(size: 25))
                .frame(width: 350, height: 100)
                .multilineTextAlignment(.center)
                .offset(y: -50)
        }
        
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
       ItemView(ani: "9566-lightbulb-bouncing-and-blinking", text: "Train your brain with a fun and fast paced game!")
    }
}
