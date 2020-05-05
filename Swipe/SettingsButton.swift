import SwiftUI

struct SettingsButton: View {
    
    @State var showResults = false
    @Binding var filter: Filters
    
    var body: some View {
        NavigationLink(destination: SettingView(filter: $filter), isActive: self.$showResults) {
            Button(action: {
                self.showResults = true
            }) {
                HStack {
                    Text("Settings")
                        .font(.system(size: 25))
                        .foregroundColor(Color.white)
                }
                .frame(width: 300, height: 40)
                .background(Color(0xeb5082))
                .cornerRadius(50)
                .shadow(color: Color(0xe20147), radius: 1, x: 2, y: 2)
            }
        }
    }
}

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButton(filter: .constant(Filters(timeFilter: 5.0, countFilter: 8.0)))
    }
}
