import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
    var body: some View {
        VStack{
            NavigationView {
                NavigationLink("Go to TeamsView", destination: TeamsView())
            }
        }
        .navigationTitle("Welcome To Validictions")
    }
}
