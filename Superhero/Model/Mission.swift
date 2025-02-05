//
//  Mission.swift
//  Superhero
//
//  Created by Francis Adelante on 2/5/25.
//

import UIKit
typealias Missions = [Mission]

class Mission: Codable {
    var missionTitle: String
    var details: String
    var datePosted: String
    var difficulty: Int
}
