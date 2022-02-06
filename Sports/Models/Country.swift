//
//  Country.swift
//  Sports
//
//  Created by Ahmed on 1/31/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation

class Country: Decodable {
    
    var idLeague: String?
    var idSoccerXML: String?
    var idAPIfootball: String?
    var strSport: String?
    var strLeague: String?
    var strLeagueAlternate: String?
    var strDivision: String?
    var idCup: String?
    var strCurrentSeason: String?
    var intFormedYear: String?
    var dateFirstEvent: String?
    var strGender: String?
    var strCountry: String?
    var strWebsite: String?
    var strFacebook: String?
    var strInstagram: String?
    var strTwitter: String?
    var strYoutube: String?
    var strRSS: String?
    var strDescriptionEN: String?
    var strDescriptionDE: String?
    var strDescriptionFR: String?
    var strDescriptionIT: String?
    var strDescriptionCN: String?
    var strDescriptionJP: String?
    var strDescriptionRU: String?
    var strDescriptionES: String?
    var strDescriptionPT: String?
    var strDescriptionSE: String?
    var strDescriptionNL: String?
    var strDescriptionHU: String?
    var strDescriptionNO: String?
    var strDescriptionPL: String?
    var strDescriptionIL: String?
    var strTvRights: String?
    var strFanart1: String?
    var strFanart2: String?
    var strFanart3: String?
    var strFanart4: String?
    var strBanner: String?
    var strBadge: String?
    var strLogo: String?
    var strPoster: String?
    var strTrophy: String?
    var strNaming: String?
    var strComplete: String?
    var strLocked: String?
    
    init() {
        
    }
    
    init(idLeague: String, idSoccerXML: String, idAPIfootball: String, strSport: String, strLeague: String, strLeagueAlternate: String, strDivision: String, idCup: String, strCurrentSeason: String, intFormedYear: String, dateFirstEvent: String, strGender: String, strCountry: String, strWebsite: String, strFacebook: String, strInstagram: String, strTwitter: String, strYoutube: String, strRSS: String, strDescriptionEN: String, strDescriptionDE: String, strDescriptionFR: String, strDescriptionIT: String, strDescriptionCN: String, strDescriptionJP: String, strDescriptionRU: String, strDescriptionES: String, strDescriptionPT: String, strDescriptionSE: String, strDescriptionNL: String, strDescriptionHU: String, strDescriptionNO: String, strDescriptionPL: String, strDescriptionIL: String, strTvRights: String, strFanart1: String, strFanart2: String, strFanart3: String, strFanart4: String, strBanner: String, strBadge: String, strLogo: String, strPoster: String, strTrophy: String, strNaming: String, strComplete: String, strLocked: String) {
        self.idLeague = idLeague
        self.idSoccerXML = idSoccerXML
        self.idAPIfootball = idAPIfootball
        self.strSport = strSport
        self.strLeague = strLeague
        self.strLeagueAlternate = strLeagueAlternate
        self.strDivision = strDivision
        self.idCup = idCup
        self.strCurrentSeason = strCurrentSeason
        self.intFormedYear = intFormedYear
        self.dateFirstEvent = dateFirstEvent
        self.strGender = strGender
        self.strCountry = strCountry
        self.strWebsite = strWebsite
        self.strFacebook = strFacebook
        self.strInstagram = strInstagram
        self.strTwitter = strTwitter
        self.strYoutube = strYoutube
        self.strRSS = strRSS
        self.strDescriptionEN = strDescriptionEN
        self.strDescriptionDE = strDescriptionDE
        self.strDescriptionFR = strDescriptionFR
        self.strDescriptionIT = strDescriptionIT
        self.strDescriptionCN = strDescriptionCN
        self.strDescriptionJP = strDescriptionJP
        self.strDescriptionRU = strDescriptionRU
        self.strDescriptionES = strDescriptionES
        self.strDescriptionPT = strDescriptionPT
        self.strDescriptionSE = strDescriptionSE
        self.strDescriptionNL = strDescriptionNL
        self.strDescriptionHU = strDescriptionHU
        self.strDescriptionNO = strDescriptionNO
        self.strDescriptionPL = strDescriptionPL
        self.strDescriptionIL = strDescriptionIL
        self.strTvRights = strTvRights
        self.strFanart1 = strFanart1
        self.strFanart2 = strFanart2
        self.strFanart3 = strFanart3
        self.strFanart4 = strFanart4
        self.strBanner = strBanner
        self.strBadge = strBadge
        self.strLogo = strLogo
        self.strPoster = strPoster
        self.strTrophy = strTrophy
        self.strNaming = strNaming
        self.strComplete = strComplete
        self.strLocked = strLocked
    }
}
