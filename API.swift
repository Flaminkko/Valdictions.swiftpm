//
//  API.swift
//  Valdictions
//
//  Created by Olivier Zdunczyk on 4/23/24.
//

import Foundation
import SwiftUI

struct Team: Identifiable, Codable {
    let id: String
    let url: String
    let name: String
    let img: String
    let country: String
}

struct TeamData: Decodable {
    let data: [Team]
}

class TeamsViewModel: ObservableObject {
    @Published var teams: [Team] = []
    
    func loadData() {
        guard let url = URL(string: "https://vlr.orlandomm.net/api/v1/teams?limit=all") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedData = try? JSONDecoder().decode(TeamData.self, from: data) {
                DispatchQueue.main.async {
                    self.teams = decodedData.data
                }
            } else {
                print("Failed to decode JSON")
            }
        }.resume()
    }
}
