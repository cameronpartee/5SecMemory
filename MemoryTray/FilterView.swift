import SwiftUI

struct FilterView: View {
    
    @State var showResults = false
    @Binding var filter: Filter
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 100) {
                Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                VStack(alignment: .center, spacing: 50) {
                    VStack(alignment: .center, spacing: 20) {
                        Text("How many items can you memorize?")
                            .bold()
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
                    VStack(alignment: .center, spacing: 20) {
                        Text("How long will it take you to memorize them?")
                            .bold()
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
                
                NavigationLink(destination: QuizView(filter: self.$filter)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                ,isActive: self.$showResults) {
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
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(filter: .constant(Filter(timeFilter: 5.0, countFilter: 8.0)))
    }
}
