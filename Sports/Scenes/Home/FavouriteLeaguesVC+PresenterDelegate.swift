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
    }

    func navigateToLeagueDetailsScreen(country: CountryModel) {
        let storyboard = UIStoryboard(name: "LeaguesDetailsAndTeams", bundle: nil)
        let leagueDetailsVC = storyboard.instantiateViewController(withIdentifier: "LeaguesDetailsVC") as! LeaguesDetailsVC
        
        leagueDetailsVC.countryCoreData = country
        
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
        Toast.showToast(controller: self, message: errorMessage, seconds: 5.0)
    }
    
}
