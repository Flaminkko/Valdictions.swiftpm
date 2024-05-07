import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
    
    var body: some View {
        VStack{
            TabView(selection: $selectedTab) {
                        Text("Go To YoutubeKit")
                            .tabItem {
                                Image(systemName: "1.circle")
                                Text("First")
                            }
                            .onTapGesture{
                                YouTubeKit()
                            }
                    
                        Text("Go To Teams View")
                            .tabItem {
                                Image(systemName: "2.circle")
                                Text("Second")
                                
                            }
                            .onTapGesture{
                                TeamsView()
                            }
            }
        }
    }
}
