//
//  Team.swift
//  Sports
//
//  Created by Mohamed Adel on 2/6/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
class Team: Codable {
    var teamid : String?
    var teamName : String?
    var stadiumName : String?
    var teamBadge : String?
    var teamDescription : String?
    
    
    enum CodingKeys : String, CodingKey {
        case teamid = "idTeam"
        case teamName = "strTeam"
        case stadiumName = "strStadium"
        case teamBadge = "strTeamBadge"
        case teamDescription = "strDescriptionEN"
    }
}
