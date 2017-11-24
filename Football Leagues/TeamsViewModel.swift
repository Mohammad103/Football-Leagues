//
//  TeamsViewModel.swift
//  Football Leagues
//
//  Created by Mohammad Shaker on 11/24/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

import UIKit

class TeamsViewModel: NSObject {

    var teams: [Team]?
    var league: League?
    
    
    func loadAllTeams(completion: @escaping () -> Void)
    {
        Team.loadAllTeams(forLeague: league!, successBlock: { (teams) in
            self.teams = teams
            completion()
        }) { (error) in
            // TODO: Show error alert
        }
    }
    
    
    func titleToDisplay() -> String {
        return league!.caption
    }
    
    
    func noOfGamesToDisplay() -> String {
        return "\(league!.numberOfGames ?? 0)"
    }
    
    
    func noOfTeamsToDisplay() -> String {
        return "\(league?.numberOfTeams ?? 0)"
    }
    
    
    func numberOfTeamsToDisplay(in section: Int) -> Int {
        return teams?.count ?? 0
    }
    
    
    func teamNameToDisplay(for indexPath: IndexPath) -> String {
        return teams?[indexPath.row].name ?? ""
    }
    
    
    func team(for indexPath: IndexPath) -> Team {
        return teams![indexPath.row]
    }
    
}
