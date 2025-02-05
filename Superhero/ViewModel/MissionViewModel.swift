//
//  MissionViewModel.swift
//  Superhero
//
//  Created by Francis Adelante on 2/5/25.
//

import Foundation
protocol MissionViewModelDelegate {
    func successfulFetch(missions: Missions)
    func failedFetch(errorMessage: String )
}
class MissionViewModel: MainViewModel {
    var delegate: MissionViewModelDelegate!
    func processLogin(username:String, password:String) {
        
        let missions = fetchPlistMissions(name: "Missions")
        guard missions != nil else {
            delegate.failedFetch(errorMessage: "Incorrect username or password.")
            return
        }
        delegate.successfulFetch(missions: missions!)
    }
}
