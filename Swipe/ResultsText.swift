import SwiftUI

struct ResultsText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
        .font(.system(size: 30))
        .foregroundColor(Color.white)
        .frame(width: 300, height: 40)
        .background(Color(0xeb5082))
        .cornerRadius(50)
        .shadow(color: Color(0xe20147), radius: 1, x: 2, y: 2)
        .padding()
    }
}

struct ResultsText_Previews: PreviewProvider {
    static var previews: some View {
        ResultsText(text: "Play Again")
    }
}
