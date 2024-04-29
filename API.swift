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
        guard let url = URL(string: "https://vlr.orlandomm.net/api/v1/teams?limit=all") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
                    
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                        return
                    }
                    
                    
                    guard let httpResponse = response as? HTTPURLResponse else {
                        print("Invalid response")
                        return
                    }
                    
                    
                    guard httpResponse.statusCode == 200 else {
                        print("HTTP status code: \(httpResponse.statusCode)")
                        return
                    }
                    
                    
                    guard let data = data else {
                        print("No data received")
                        return
                    }
                    
                    
                    do {
                        let decodedData = try JSONDecoder().decode([Teams].self, from: data)
                        // Update the state variable with the fetched posts
                        DispatchQueue.main.async {
                            self.teams = decodedData
                        }
                    } catch {
                        print("Error decoding JSON: \(error.localizedDescription)")
                    }
            }.resume() 
    }
}
