//
//  API.swift
//  Valdictions
//
//  Created by Olivier Zdunczyk on 4/23/24.
//

import Foundation
import SwiftUI

struct Teams: Identifiable, Codable {
    let id: Int
    let url: URL
    let name: String
    let img: String
    let country: String
}

class TeamsViewModel: ObservableObject {
    @Published var teams: [Teams] = []
    
    func fetchTeams() {
        guard let url = URL(string: "https://vlr.orlandomm.net/api/v1/teams?limit=all") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedTeams = try JSONDecoder().decode([Teams].self, from: data)
                    DispatchQueue.main.async {
                        self.teams = decodedTeams
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        } .resume()
    }
}
