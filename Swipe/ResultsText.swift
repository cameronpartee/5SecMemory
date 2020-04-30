import SwiftUI

struct ResultsText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
        .font(.system(size: 30))
        .padding()
        .border(Color.black, width: 1)
        .padding()
    }
}

struct ResultsText_Previews: PreviewProvider {
    static var previews: some View {
        ResultsText(text: "Play Again")
    }
}
