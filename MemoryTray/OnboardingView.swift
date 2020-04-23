import SwiftUI

struct OnboardingView: View {
    
    @State private var step = 1
    @State var showResults = false
    @Binding var filter: Filter
    
    var body: some View {
        ZStack {
            Color(0xd3995f).edgesIgnoringSafeArea(.all)
            VStack(spacing: 90) {
                Image("icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .padding()
                    .offset(y: 30)
                
                GeometryReader { gr in
                    HStack {
                        VStack(spacing: 40) {
                            Text("The Memory Game will measure your ability too memorize and recall information.")
                                .bold()
                                .padding()
                                .foregroundColor(Color.black)
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gr.frame(in: .global).width)
                        
                        VStack(spacing: 40) {
                            Text("Design your game by setting a timer and choosing an amount of objects.")
                                .bold()
                                .padding()
                                .foregroundColor(Color.black)
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gr.frame(in: .global).width)
                        
                        VStack(spacing: 40) {
                            Text("Do your best to spell the items correctly. You will not be penalized for incorrect answer, only rewarded for correct ones.")
                                .bold()
                                .padding()
                                .foregroundColor(Color.black)
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gr.frame(in: .global).width)
                    }
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.black)
                    .font(.title)
                    .padding(.vertical, 60)
                    .frame(width: gr.frame(in: .global).width * 3)
                    .frame(maxHeight: .infinity)
                    .offset(x: self.step == 1 ? gr.frame(in: .global).width : self.step == 2 ? 0 : -gr.frame(in: .global).width)
                    .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8))
                }
                
                NavigationLink(destination: FilterView(filter: $filter)
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
                            .opacity(step == 3 ? 1 : 0)
                            .animation(.none)
                            .scaleEffect(step == 3 ? 1 : 0.01)
                            .animation(Animation.interpolatingSpring(stiffness: 50, damping: 10, initialVelocity: 10))
                        }
                }
                
                
                HStack(spacing: 20) {
                    Button(action: {self.step = 1}) {
                        Image(systemName: "1.circle")
                            .foregroundColor(Color.black)
                            .padding()
                            .scaleEffect(step == 1 ? 1 : 0.65)
                    }
                    Button(action: {self.step = 2}) {
                        Image(systemName: "2.circle")
                            .foregroundColor(Color.black)
                            .padding()
                            .scaleEffect(step == 2 ? 1 : 0.65)
                    }
                    Button(action: {self.step = 3}) {
                        Image(systemName: "3.circle")
                            .foregroundColor(Color.black)
                            .padding()
                            .scaleEffect(step == 3 ? 1 : 0.65)
                    }
                }
                .animation(.spring(response: 0.4, dampingFraction: 0.5))
                .font(.largeTitle)
                .accentColor(Color("LightAccent"))
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(filter: .constant(Filter(timeFilter: 10.0, countFilter: 10.0)))
    }
}
