import SwiftUI

struct Filter {
    var timeFilter: Float
    var countFilter: Float
}

struct ContentView: View {
    
    @State private var filter = Filter(timeFilter: 5.0, countFilter: 8.0)
    
    var body: some View {
        NavigationView {
            OnboardingView(filter: $filter)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
