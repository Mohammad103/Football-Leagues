//
//  LeaguesViewModel.swift
//  Football Leagues
//
//  Created by Mohammad Shaker on 11/24/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

import UIKit

class LeaguesViewModel: NSObject {

    var leagues: [League]?
    
    
    func loadAllLeagues(completion: @escaping () -> Void)
    {
        League.loadAllLeagues(successBlock: { (leagues) in
            self.leagues = leagues
            completion()
        }) { (error) in
            // TODO: Show error alert
        }
    }
    
    
    func numberOfItemsToDisplay(in section: Int) -> Int {
        return leagues?.count ?? 0
    }
    
    
    func titleToDisplay(for indexPath: IndexPath) -> String {
        return leagues?[indexPath.row].caption ?? ""
    }
    
    
    func noOfGamesToDisplay(for indexPath: IndexPath) -> String {
        return "\(leagues?[indexPath.row].numberOfGames ?? 0)"
    }
    
    
    func noOfTeamsToDisplay(for indexPath: IndexPath) -> String {
        return "\(leagues?[indexPath.row].numberOfTeams ?? 0)"
    }
    
}
