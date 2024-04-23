//
//  API.swift
//  Valdictions
//
//  Created by Olivier Zdunczyk on 4/23/24.
//

import Foundation
import SwiftUI

struct Teams: Codable {
    let id: Int
    let url: URL
    let name: String
    let img: String
    let country: String
}
