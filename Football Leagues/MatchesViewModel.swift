//
//  MatchesViewModel.swift
//  Football Leagues
//
//  Created by Mohammad Shaker on 11/24/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

import UIKit

class MatchesViewModel: NSObject {

    var matches: [Match]?
    var team: Team?
    
    
    func loadAllMatches(completion: @escaping () -> Void)
    {
        Match.loadAllMatches(forTeam: team!, successBlock: { (matches) in
            self.matches = matches
            completion()
        }) { (error) in
            // TODO: Show error alert
        }
    }
    
    
    func titleToDisplay() -> String {
        return team!.name
    }
    
    
    func teamLogoURL() -> String {
        return team!.logoURL
    }
    
    
    func numberOfMatchesToDisplay(in section: Int) -> Int {
        return matches?.count ?? 0
    }
    
    
    func isMatchFinished(for indexPath: IndexPath) -> Bool {
        return matches?[indexPath.row].status == "FINISHED"
    }
    
    
    func matchDateToDisplay(for indexPath: IndexPath) -> String {
        return matches?[indexPath.row].date ?? ""
    }
    
    
    func matchResultToDisplay(for indexPath: IndexPath) -> String {
        return "\(matches?[indexPath.row].goalsHomeTeam ?? 0) - \(matches?[indexPath.row].goalsAwayTeam ?? 0)"
    }
    
}
