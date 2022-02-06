//
//  FavouriteLeaguesVC+PresenterDelegate.swift
//  Sports
//
//  Created by Ahmed on 2/2/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
import UIKit

extension FavouriteLeaguesVC: CoreDataLeagues {
    
    func fetchingDataSuccess() {
        tableViewLeague.reloadData()
    }
    
    func showError(error: String) {
        print(error)
        Toast.showToast(controller: self, message: error, seconds: 3.0)
    }

    func navigateToLeagueDetailsScreen(country: CountryModel) {
        let storyboard = UIStoryboard(name: "LeaguesDetailsAndTeams", bundle: nil)
        let leagueDetailsVC = storyboard.instantiateViewController(withIdentifier: "LeaguesDetailsVC") as! LeaguesDetailsVC
        
        let newCountry: Country = Country()
        newCountry.idLeague = country.idLeague
        newCountry.idSoccerXML = country.idSoccerXML
        newCountry.idAPIfootball = country.idAPIfootball
        newCountry.strSport = country.strSport
        newCountry.strLeague = country.strLeague
        newCountry.strLeagueAlternate = country.strLeagueAlternate
        newCountry.strDivision = country.strDivision
        newCountry.idCup = country.idCup
        newCountry.strCurrentSeason = country.strCurrentSeason
        newCountry.intFormedYear = country.intFormedYear
        newCountry.dateFirstEvent = country.dateFirstEvent
        newCountry.strGender = country.strGender
        newCountry.strCountry = country.strCountry
        newCountry.strWebsite = country.strWebsite
        newCountry.strFacebook = country.strFacebook
        newCountry.strInstagram = country.strInstagram
        newCountry.strTwitter = country.strTwitter
        newCountry.strYoutube = country.strYoutube
        newCountry.strRSS = country.strRSS
        newCountry.strDescriptionEN = country.strDescriptionEN
        newCountry.strDescriptionDE = country.strDescriptionDE
        newCountry.strDescriptionFR = country.strDescriptionFR
        newCountry.strDescriptionIT = country.strDescriptionIT
        newCountry.strDescriptionCN = country.strDescriptionCN
        newCountry.strDescriptionJP = country.strDescriptionJP
        newCountry.strDescriptionRU = country.strDescriptionRU
        newCountry.strDescriptionES = country.strDescriptionES
        newCountry.strDescriptionPT = country.strDescriptionPT
        newCountry.strDescriptionSE = country.strDescriptionSE
        newCountry.strDescriptionNL = country.strDescriptionNL
        newCountry.strDescriptionHU = country.strDescriptionHU
        newCountry.strDescriptionNO = country.strDescriptionNO
        newCountry.strDescriptionPL = country.strDescriptionPL
        newCountry.strDescriptionIL = country.strDescriptionIL
        newCountry.strTvRights = country.strTvRights
        newCountry.strFanart1 = country.strFanart1
        newCountry.strFanart2 = country.strFanart2
        newCountry.strFanart3 = country.strFanart3
        newCountry.strFanart4 = country.strFanart4
        newCountry.strBanner = country.strBanner
        newCountry.strBadge = country.strBadge
        newCountry.strLogo = country.strLogo
        newCountry.strPoster = country.strPoster
        newCountry.strTrophy = country.strTrophy
        newCountry.strNaming = country.strNaming
        newCountry.strComplete = country.strComplete
        newCountry.strLocked = country.strLocked
        
        leagueDetailsVC.country = newCountry
        self.present(leagueDetailsVC, animated: true, completion: nil)
    }
    
    func openYoutube(youtubeLink: String) {
        var youtubeURL = URL(string:"youtube://\(youtubeLink)")!
        if !UIApplication.shared.canOpenURL(youtubeURL) {
            youtubeURL = URL(string: "https://\(youtubeLink)")!
        }
        UIApplication.shared.open(youtubeURL)
    }
    
    func networkError(errorMessage: String) {
        Toast.showToast(controller: self, message: errorMessage, seconds: 3.0)
    }
    
}
