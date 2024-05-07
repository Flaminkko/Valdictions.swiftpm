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
    @State var userPointsBet: Int = 0
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
            TextField("How many points do you want to use?", value: $userPointsBet, format: .number)
                .textFieldStyle(.roundedBorder)
        }
    }
}
