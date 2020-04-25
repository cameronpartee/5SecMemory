import SwiftUI

struct OnboardingView: View {
    
    @State private var step = 1
    @State private var showResults = false
    @State private var growIcon = true
    @Binding var filter: Filter
    
    var body: some View {
        ZStack {
            Color(0xF4BFCC).edgesIgnoringSafeArea(.all)
            VStack(spacing: 90) {
                VStack(spacing: 15) {
                    Text("5 Second Memory")
                        .bold()
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .scaleEffect(self.growIcon ? 1.2 : 1)
                        .animation(Animation.easeInOut(duration: 2)
                            .repeatForever(autoreverses: true))
                        .onAppear() {
                            self.growIcon.toggle()
                    }
                    }.offset(y: 30)
                    
                    GeometryReader { gr in
                    HStack {
                        VStack(spacing: 20) {
                            Image("on1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130, height: 110)
                            Text("Train your brain with a fun and fast paced game!")
                                .bold()
                                .font(.system(size: 30))
                                .padding()
                                .foregroundColor(Color.white)
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gr.frame(in: .global).width)
                        
                        VStack(spacing: 40) {
                            Image("on2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130, height: 110)
                            Text("The rules are simple. Memorize all eight items in five seconds. Test out each setting for optimal brain training! ")
                                .bold()
                                .padding()
                                .foregroundColor(Color.white)
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gr.frame(in: .global).width)
                        
                        VStack(spacing: 40) {
                            Image("on3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130, height: 110)
                            Text("Do your best to spell each item correctly. Play 3 times a day to improve your memorization skills.")
                                .bold()
                                .padding()
                                .foregroundColor(Color.white)
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
                    .offset(y: 60)
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
                            .foregroundColor(Color.white)
                            .padding()
                            .scaleEffect(step == 1 ? 1 : 0.65)
                    }
                    Button(action: {self.step = 2}) {
                        Image(systemName: "2.circle")
                            .foregroundColor(Color.white)
                            .padding()
                            .scaleEffect(step == 2 ? 1 : 0.65)
                    }
                    Button(action: {self.step = 3}) {
                        Image(systemName: "3.circle")
                            .foregroundColor(Color.white)
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
