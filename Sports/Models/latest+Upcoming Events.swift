//
//  latest+Upcoming Events.swift
//  Sports
//
//  Created by Mohamed Adel on 2/3/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
class UpcomingEvent: Decodable {
    var homeTeam : String?
    var awayTeam : String?
    var dateEvent : String?
    var time : String?
    var homeTeamId : String?
    var awayTeamId : String?
    
    enum CodingKeys : String,CodingKey {
        case homeTeam = "strHomeTeam"
        case awayTeam = "strAwayTeam"
        case time = "strTime"
        case homeTeamId = "idHomeTeam"
        case awayTeamId = "idAwayTeam"
    }
}
