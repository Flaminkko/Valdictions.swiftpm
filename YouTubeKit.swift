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

    @StateObject
    var youTubePlayer: YouTubePlayer = "https://www.youtube.com/watch?v=IHf_GgYY2zg"

    var body: some View {
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

}
