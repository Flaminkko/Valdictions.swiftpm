import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: TeamsView()) {
                Text("Go to TeamsView")
            }
        }
    }
}
