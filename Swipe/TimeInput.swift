import SwiftUI

struct TimeInput: View {
    
    @Binding var filter: Filters
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("How long will it take you to memorize them?")
                .font(.system(size: 30))
            VStack(alignment: .leading, spacing: -5) {
                Text(String(format: "%.2f sec", self.filter.timeFilter))
                    .bold()
                    .font(.system(size: 25))
                    .foregroundColor(Color.blue)
                Slider(value: self.$filter.timeFilter, in: 2...10, step: 1)
            }.padding(.leading, 30)
                .padding(.trailing, 30)
        }
    }
}

struct TimeInput_Previews: PreviewProvider {
    static var previews: some View {
        TimeInput(filter: .constant(Filters(timeFilter: 5.0, countFilter: 8.0)))
    }
}
