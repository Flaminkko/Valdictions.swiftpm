import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
    var body: some View {
        VStack{
            NavigationView {
                NavigationLink("Go to TeamsView", destination: TeamsView())
                NavigationLink("Go to YoutubeKit", destination: YouTubeKit())
            }
        }
        .navigationTitle("Welcome To Validictions")
    }
}
