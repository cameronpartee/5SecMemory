import SwiftUI

struct CarouselView: View {
    
    var data = Data()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(data.slides) {
                    item in
                    GeometryReader {
                        geometry in
                        ItemView(ani: item.ani, text: item.text)
                            .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 40) / -20), axis: (x: 0, y:10.0, z: 0))
                    }
                    .frame(width: 400, height: 400)
                    .padding()
                }
            }
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}
