import SwiftUI

struct CountInput: View {
    
    @Binding var filter: Filters
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("How many items can you memorize?")
                .font(.system(size: 30))
            VStack(alignment: .leading, spacing: -5) {
                Text(String(format: "%.2f", self.filter.countFilter))
                    .bold()
                    .font(.system(size: 25))
                    .foregroundColor(Color.blue)
                Slider(value: self.$filter.countFilter, in: 4...10, step: 1)
            }.padding(.leading, 30)
                .padding(.trailing, 30)
        }
    }
}

struct CountInput_Previews: PreviewProvider {
    static var previews: some View {
        CountInput(filter: .constant(Filters(timeFilter: 5.0, countFilter: 8.0)))
    }
}
