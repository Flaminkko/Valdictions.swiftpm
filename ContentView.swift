import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: TeamsView()) {
                Text("Go to TeamsView")
            }
            NavigationView{
                NavigationLink("Go to YouTubeKit", destination: YouTubeKit())
            }
            navigationTitle("Welcome To Validictions")
        }
    }
}
