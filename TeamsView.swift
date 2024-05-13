//
//  TeamsView.swift
//  Valdictions
//
//  Created by Olivier Zdunczyk on 4/25/24.
//

import Foundation
import SwiftUI

struct TeamsView: View {
    @StateObject private var viewModel = TeamsViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.teams, id: \.id) { team in
                NavigationLink(destination: TeamDetailsView(team: team)) {
                    Text(team.name)
                }
            }
            .navigationTitle("Teams")
        }
        .onAppear(perform: {
            viewModel.loadData()
        })
    }
}
