//
//  YouTubeKit.swift
//  Valdictions
//
//  Created by Pavel Sliziuk on 4/23/24.
//

import Foundation
import SwiftUI
import YouTubePlayerKit

struct YouTubeKit: View {
@StateObject var youTubePlayer: YouTubePlayer = "https://www.youtube.com/watch?v=wpDdRR-BqdU"
    @AppStorage("UserPointsStorage") var userPoints: Int = 100
    @State var predictAmount = ""
    @State var selectedTeamIndex = 0
    let teams = ["Sentinels", "Gen.G"]
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 100, height: 50, alignment: .topTrailing)
                .foregroundStyle(.black)
                .overlay() {
                    Text("Points: \(userPoints)")
                        .foregroundStyle(.white)
                }
            Rectangle()
                .overlay() {
                    YouTubePlayerView(self.youTubePlayer) { state in
                        switch state {
                        case .idle:
                            ProgressView()
                        case .ready:
                            EmptyView()
                        case .error(_):
                            Text(verbatim: "YouTube player couldn't be loaded")
                    }
                }
            }
                .padding()
            TextField("How many points do you want to use?", text: $predictAmount)
                .textFieldStyle(.roundedBorder)
            Picker("Select Team", selection: $selectedTeamIndex) {
                ForEach(0..<teams.count) { index in
                    Text(self.teams[index]).tag(index)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            Button("Predict") {
                if let predict = Int(predictAmount), predict <= userPoints, predict > 0 {
                    let selectedTeam = teams[selectedTeamIndex]
                    let winningTeam = "Sentinels"
                    if selectedTeam == winningTeam {
                        userPoints += predict
                    } else {
                        userPoints -= predict
                    }
                } else {
                    print("Invalid Bet Amount")
                }
            }
        }
    }
}

