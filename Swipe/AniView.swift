import SwiftUI
import Lottie

struct AniView: UIViewRepresentable {
    var text: String
    func makeUIView(context: UIViewRepresentableContext<AniView>) ->  AnimationView {
        
        let aniView = AnimationView()
        let animation = Animation.named(text)
        aniView.animation = animation
        aniView.loopMode = .loop
        aniView.backgroundBehavior = .pauseAndRestore
        aniView.play()
        return aniView
    }
    func updateUIView(_ uiView: AnimationView, context: UIViewRepresentableContext<AniView>) {
    }
}

struct AniView_Previews: PreviewProvider {
    static var previews: some View {
        AniView(text: "9566-lightbulb-bouncing-and-blinking")
    }
}
