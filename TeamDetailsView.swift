//
//  TeamDetailsView.swift
//  Valdictions
//
//  Created by Olivier Zdunczyk on 4/25/24.
//

import Foundation
import SwiftUI

struct TeamDetailsView: View {
    let team: Teams
    var body: some View {
        VStack(spacing: 20) {
            Text(team.name)
                .font(.largeTitle)
            Image("\(team.img)")
            Text("Country: \(team.country)")
            Text("URL: \(team.url)")
        }
        .padding()
    }
}
