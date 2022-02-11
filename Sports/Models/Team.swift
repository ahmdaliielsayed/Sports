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
    var teamCountry : String?
    var stadiumImg : String?
    var tShirtImg : String?
    var teamBanner : String?
    var teamWebsite : String?
    var teamFacebook : String?
    var teamTwitter : String?
    var teamInstagram : String?
    var teamYoutube : String?
    var teamLocation : String?
    var stadiumDate : String?
    
    
    enum CodingKeys : String, CodingKey {
        case teamid = "idTeam"
        case teamName = "strTeam"
        case stadiumName = "strStadium"
        case teamBadge = "strTeamBadge"
        case teamDescription = "strDescriptionEN"
        case teamCountry = "strCountry"
        case stadiumImg = "strStadiumThumb"
        case tShirtImg = "strTeamJersey"
        case teamBanner = "strTeamBanner"
        case teamWebsite = "strWebsite"
        case teamFacebook = "strFacebook"
        case teamTwitter = "strTwitter"
        case teamInstagram = "strInstagram"
        case teamYoutube = "strYoutube"
        case teamLocation = "strStadiumLocation"
        case stadiumDate = "intFormedYear"
    }
}
