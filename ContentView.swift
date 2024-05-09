import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
    var body: some View {
        VStack{
            TabView(selection: $selectedTab) {
                YouTubeKit()
                    .tabItem {
                        Image(systemName: "tv.fill")
                        Text("Watch/Predict")
                    }
                    .tag(0)
                
                TeamsView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Teams")
                    }
                    .tag(1)
            }
        }
    }
}
