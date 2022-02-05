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
        //teamsCollectionView.reloadData()
    }
    
    func getLeagueId()->String{
        return idLeague ?? ""
    }
    
}
