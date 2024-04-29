import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
    var body: some View {
        VStack{
            TabView(selection: $selectedTab) {
                NavigationLink(destination: YouTubeKit()) {
                    Text("Go To Youtubekitview")
                } .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }
                NavigationLink(destination: TeamsView()) {
                    Text("Go to TeamsView")
                }
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }
            }
        }
        .navigationTitle("Welcome To Validictions")
    }
}
