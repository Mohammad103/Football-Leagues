//
//  Match.swift
//  Football Leagues
//
//  Created by Mohammad Shaker on 11/24/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

import UIKit
import SwiftyJSON

class Match: NSObject {
    
    var homeTeamName: String! = ""
    var awayTeamName: String! = ""
    var date: String! = ""
    var status: String! = ""
    var goalsHomeTeam: Int! = 0
    var goalsAwayTeam: Int! = 0
    
    
    class func parse(json: JSON) -> Match
    {
        let match: Match = Match()
        match.homeTeamName = json["homeTeamName"].string ?? ""
        match.awayTeamName = json["awayTeamName"].string ?? ""
        match.date = json["date"].string ?? ""
        match.status = json["status"].string ?? ""
        match.goalsHomeTeam = json["result"]["goalsHomeTeam"].int ?? 0
        match.goalsAwayTeam = json["result"]["goalsAwayTeam"].int ?? 0
        
        return match
    }
    
    
    class func loadAllMatches(forTeam team: Team, successBlock: @escaping (_ matches: [Match]) -> Void, failureBlock: @escaping (_ error: String) -> Void)
    {
        let networkAPI = NetworkAPI()
        networkAPI.get(url: team.fixturesURL, parameters: nil, headers: nil, successBlock: { (responseObject) in
            var matches: [Match] = []
            let matchesJson = JSON(responseObject)["fixtures"].arrayValue
            for dict in matchesJson {
                matches.append(Match.parse(json: dict))
            }
            successBlock(matches)
        }) { (error) in
            failureBlock(error)
        }
    }
    
}
