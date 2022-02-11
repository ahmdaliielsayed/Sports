//
//  LeagueDetailVC+Protocol.swift
//  Sports
//
//  Created by Mohamed Adel on 2/4/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
import UIKit


extension LeaguesDetailsVC : LeagueDetailsViewProtocol
{
        
    func getLeagueData() -> Country {
        return country!
    }
      
    func showIndicator() {
        indicator.center = self.view.center
        indicator.color = UIColor.white
        self.view.addSubview(indicator)
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.stopAnimating()
    }
    func updateView()
    {
        upcomingCollectionView.reloadData()
        leastCollectionView.reloadData()
        teamsCollectionView.reloadData()
    }
    
    func getLeagueId()->String{
        return country!.idLeague!
    }
    
    func displayFavouriteImage(isFavourite: Bool) {
        if isFavourite {
            btnFavOutlet.setImage(UIImage(named: "favourite"), for: .normal)
        } else {
            btnFavOutlet.setImage(UIImage(named: "star"), for: .normal)
        }
    }
    
    func navigateToTeamDetailsVC(team: Team) {

        let teamVC : TeamViewController = self.storyboard?.instantiateViewController(withIdentifier: "TeamViewController") as! TeamViewController

        teamVC.team = team
        teamVC.modalPresentationStyle = .fullScreen
        self.present(teamVC,animated: true)
    }
    
}
				
