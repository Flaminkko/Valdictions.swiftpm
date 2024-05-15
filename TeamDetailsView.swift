//
//  TeamDetailsView.swift
//  Valdictions
//
//  Created by Olivier Zdunczyk on 4/25/24.
//

import Foundation
import SwiftUI

struct TeamDetailsView: View {
    let team: Team
    var body: some View {
        VStack(spacing: 20) {
            Text(team.name)
                .font(.largeTitle)
            AsyncImage(url: URL(string: "\(team.img)"))
            Text("Country: \(team.country)")
            Link("Visit Webpage", destination: URL(string: "\(team.url)")!)
        }
        .padding()
    }
}

