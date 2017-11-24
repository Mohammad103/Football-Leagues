//
//  Team.swift
//  Football Leagues
//
//  Created by Mohammad Shaker on 11/24/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

import UIKit
import SwiftyJSON

class Team: NSObject {

    var name: String! = ""
    var fixturesURL: String! = ""
    
    class func parse(json: JSON) -> Team
    {
        let team: Team = Team()
        team.name = json["name"].string ?? ""
        team.fixturesURL = json["_links"]["fixtures"]["href"].string ?? ""
        
        return team
    }
    
    
    class func loadAllTeams(forLeague league: League, successBlock: @escaping (_ teams: [Team]) -> Void, failureBlock: @escaping (_ error: String) -> Void)
    {
        let networkAPI = NetworkAPI()
        networkAPI.get(url: league.teamsURL, parameters: nil, headers: nil, successBlock: { (responseObject) in
            var teams: [Team] = []
            let teamsJson = JSON(responseObject)["teams"].arrayValue
            for dict in teamsJson {
                teams.append(Team.parse(json: dict))
            }
            successBlock(teams)
        }) { (error) in
            failureBlock(error)
        }
    }
    
}
