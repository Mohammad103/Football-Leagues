//
//  League.swift
//  Football Leagues
//
//  Created by Mohammad Shaker on 11/24/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

import UIKit
import SwiftyJSON

class League: NSObject {
    
    var id: Int! = 0
    var caption: String! = ""
    var league: String! = ""
    var year: String! = ""
    var currentMatchday: Int! = 0
    var numberOfMatchdays: Int! = 0
    var numberOfTeams: Int! = 0
    var numberOfGames: Int! = 0
    var lastUpdated: String! = ""
    var teamsURL: String! = ""
    
    
    class func parse(json: JSON) -> League
    {
        let league: League = League()
        league.id = json["id"].int ?? 0
        league.caption = json["caption"].string ?? ""
        league.league = json["league"].string ?? ""
        league.year = json["year"].string ?? ""
        league.currentMatchday = json["currentMatchday"].int ?? 0
        league.numberOfMatchdays = json["numberOfMatchdays"].int ?? 0
        league.numberOfTeams = json["numberOfTeams"].int ?? 0
        league.numberOfGames = json["numberOfGames"].int ?? 0
        league.lastUpdated = json["lastUpdated"].string ?? ""
        league.teamsURL = json["_links"]["teams"]["href"].string ?? ""
        
        return league
    }
    
    
    class func loadAllLeagues(successBlock: @escaping (_ leagues: [League]) -> Void, failureBlock: @escaping (_ error: String) -> Void)
    {
        let url = "http://api.football-data.org/v1/competitions"
        
        let networkAPI = NetworkAPI()
        networkAPI.get(url: url, parameters: nil, headers: nil, successBlock: { (responseArray) in
            var leagues: [League] = []
            for dict in responseArray {
                let swiftyJson = JSON(dict)
                leagues.append(League.parse(json: swiftyJson))
            }
            successBlock(leagues)
        }) { (error) in
            failureBlock(error)
        }
    }
    
}
