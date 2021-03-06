//
//  SportsVC+PresenterDelegate.swift
//  Sports
//
//  Created by Ahmed on 1/30/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
import UIKit

extension SportsVC: SportsView {
    
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
        sportsCV.reloadData()
    }
    
    func showError(error: String) {
        print(error)
        Toast.showToast(controller: self, message: error, seconds: 3.0)
    }
    
    func navigateToLeaguesScreen(sport: Sport) {
        let leaguesVC: LeagueViewController = (self.storyboard?.instantiateViewController(identifier: "leaguesVC"))!

        leaguesVC.sport = sport

        navigationController?.pushViewController(leaguesVC, animated: true)
    }
    
    func networkError(errorMessage: String) {
        Toast.showToast(controller: self, message: errorMessage, seconds: 3.0)
    }
}
