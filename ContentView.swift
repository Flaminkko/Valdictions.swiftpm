import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
    var body: some View {
        VStack{
            TabView(selection: $selectedTab) {
                HomePage()
                    .tabItem {
                        Image(systemName: "house.circle")
                        Text("Home")
                    }
                    .tag(0)
                YouTubeKit()
                    .tabItem {
                        Image(systemName: "tv.fill")
                        Text("Watch/Predict")
                    }
                    .tag(1)
                
                TeamsView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Teams")
                    }
                    .tag(2)
               
            }
        }
    }
}
