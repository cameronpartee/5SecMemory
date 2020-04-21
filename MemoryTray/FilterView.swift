import SwiftUI

struct Filter {
    var timeFilter: Float
    var countFilter: Float
}


struct FilterView: View {
    
    @State private var filter = Filter(timeFilter: 10.0, countFilter: 10.0)
    @State var showResults = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 80) {
                Image("icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .padding()
                
                VStack(alignment: .center) {
                    VStack(alignment: .center) {
                        Text("How many items can you memorize?")
                            .bold()
                            .font(.system(size: 30))
                            .multilineTextAlignment(.center)
                        VStack(alignment: .leading, spacing: -5) {
                            Text(String(format: "%.2f", self.filter.countFilter))
                                .bold()
                                .font(.system(size: 25))
                                .foregroundColor(Color.blue)
                            Slider(value: self.$filter.countFilter, in: 3...14, step: 1)
                        }.padding(.leading, 30)
                        .padding(.trailing, 30)
                    }
                    VStack(alignment: .center) {
                        Text("How long will it take you to memorize them?")
                            .bold()
                            .font(.system(size: 30))
                            .multilineTextAlignment(.center)
                        VStack(alignment: .leading, spacing: -5) {
                            Text(String(format: "%.2f sec", self.filter.timeFilter))
                                .bold()
                                .font(.system(size: 25))
                                .foregroundColor(Color.blue)
                            Slider(value: self.$filter.timeFilter, in: 3...20, step: 1)
                        }.padding(.leading, 30)
                        .padding(.trailing, 30)
                    }
                }
                
                NavigationLink(destination: QuizView()
                    .navigationBarTitle("")
                    .navigationBarHidden(true), isActive: self.$showResults) {
                        Button(action: {
                            self.showResults = true
                        }) {
                            HStack {
                                Text("Continue")
                                    .bold()
                                    .font(.system(size: 25))
                                Image(systemName: "chevron.right")
                            }
                            .padding(.horizontal)
                            .padding()
                            .background(Capsule().fill(Color.blue))
                            .accentColor(Color.white)
                        }
                }
                
                
            }
            
        }
        .background(Color(0xd3995f))
        .border(Color(0x663603), width: 3)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
