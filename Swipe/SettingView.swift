import SwiftUI

struct SettingView: View {
    
    @Binding var filter: Filters
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(0xF4BFCC).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                CountInput(filter: $filter)
                TimeInput(filter: $filter)
            }.padding()
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(filter: .constant(Filters(timeFilter: 5.0, countFilter: 8.0)))
    }
}
