import SwiftUI

struct ContentView: View {
    
    @State private var filters = Filters(timeFilter: 5.0, countFilter: 8.0)
    
    var body: some View {
        NavigationView {
            ZStack  {
                Color(0xF4BFCC).edgesIgnoringSafeArea(.all)
                VStack(spacing: 50) {
                    LogoView()
                    CarouselView()
                    VStack(spacing: 15) {
                        PlayGameButton(filter: $filters)
                        SettingsButton(filter: $filters)
                    }
                }.offset(y: -50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
