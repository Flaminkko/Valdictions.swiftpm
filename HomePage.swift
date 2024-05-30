import SwiftUI

struct HomePage: View {
     @State var rotationAngle: Double = 0
    @State var currentTime = ""
     let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        GeometryReader{ geo in
            VStack{
                Text("Welcome To Valdictions")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .foregroundColor(.red)
                
                Spacer()
                Text("Curent Time:")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Text(currentTime)
                    .font(.system(size:70, weight: .bold, design: .rounded))
                    .onReceive(timer) { input in
                        let formatter = DateFormatter()
                        formatter.dateFormat = "HH:mm:ss"
                        currentTime = formatter.string(from: Date())
                           
                    }
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .aspectRatio(contentMode: .fill)
            .background(
                VideoBg()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.height)
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 0)
            )
            
        }
    }
    
    
    
}
