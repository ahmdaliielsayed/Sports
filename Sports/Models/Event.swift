//
//  latest+Upcoming Events.swift
//  Sports
//
//  Created by Mohamed Adel on 2/3/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
class Event: Codable {
    var EvnetTitle : String?
    var homeTeam : String?
    var awayTeam : String?
    var date : String?
    var homeTeamId : String?
    var awayTeamId : String?
    var leagueName : String?
    var homeTeamScore : String?
    var awayTeamScore : String?
    static var upcomingEventCount : Int?
    static var latestEventCount : Int?
    var isFinished:Bool?
    var dateEvent : String?
    
    //var time : String!
    enum CodingKeys : String,CodingKey {
        case EvnetTitle = "strEvent"
        case homeTeam = "strHomeTeam"
        case awayTeam = "strAwayTeam"
        case date = "strTimestamp"
        case homeTeamId = "idHomeTeam"
        case awayTeamId = "idAwayTeam"
        case leagueName = "strLeague"
        case homeTeamScore = "intHomeScore"
        case awayTeamScore = "intAwayScore"
        case dateEvent = "dateEvent"
    }
}
