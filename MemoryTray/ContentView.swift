import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            OnboardingView()
        }.border(Color.blue, width: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
