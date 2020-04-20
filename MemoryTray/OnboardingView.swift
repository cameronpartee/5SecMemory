import SwiftUI

struct OnboardingView: View {
    
    @State private var step = 1
    @State var showResults = false
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                Image("m").offset(y: 50)
                GeometryReader { gr in
                    HStack {
                        VStack(spacing: 40) {
                            Image("bee")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            Text("Memory Tray will measure how you soak in￼ information and how you apply information!")
                                .bold()
                                .padding()
                                .foregroundColor(Color.black)
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gr.frame(in: .global).width)
                        
                        VStack(spacing: 40) {
                            Image("Monkey")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            Text("Design your assesment by choosing a category and an amount.")
                                .bold()
                                .padding()
                                .foregroundColor(Color.black)
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gr.frame(in: .global).width)
                        
                        VStack(spacing: 40) {
                            Image("people")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            Text("To begin click continue. Have fun and don’t forget to use your brain!￼￼￼￼￼￼")
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
                    .offset(y: 60)
                }
                
                
                NavigationLink(destination: QuizView()
                    .navigationBarTitle("")
                    .navigationBarHidden(true), isActive: self.$showResults) {
                    Button(action: {
                        self.showResults = true
                    }) {
                        HStack {
                            Text("Continue")
                                .font(.system(size: 25))
                            Image(systemName: "chevron.right")
                        }
                        .padding(.horizontal)
                        .padding()
                        .background(Capsule().fill(Color("Accent2")))
                        .accentColor(Color("LightAccent"))
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
        OnboardingView()
    }
}
