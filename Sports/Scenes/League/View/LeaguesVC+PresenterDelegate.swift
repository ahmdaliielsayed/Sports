//
//  LeaguesVC+PresenterDelegate.swift
//  Sports
//
//  Created by Ahmed on 1/31/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
import UIKit

extension LeagueViewController: countrysLeague {
    
    func showIndicator() {
        indicator.center = self.view.center
        indicator.color = UIColor.white
        self.view.addSubview(indicator)
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.stopAnimating()
    }
    
    func fetchingDataSuccess() {
        tableView.reloadData()
    }
    
    func showError(error: String) {
        print(error)
        Toast.showToast(controller: self, message: error, seconds: 3.0)
    }
    
    func navigateToLeagueDetailsScreen(country: Country) {
        let storyboard = UIStoryboard(name: "LeaguesDetailsAndTeams", bundle: nil)
        let leagueDetailsVC = storyboard.instantiateViewController(withIdentifier: "LeaguesDetailsVC") as! LeaguesDetailsVC
        
        leagueDetailsVC.country = country
        
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
