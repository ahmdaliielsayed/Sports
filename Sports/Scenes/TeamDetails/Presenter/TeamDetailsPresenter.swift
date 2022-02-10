//
//  TeamDetailsPresenter.swift
//  Sports
//
//  Created by Mohamed Adel on 2/6/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
import UIKit
protocol TeamViewProtocol {
    func didBackBtnPressed()
}

class TeamDetailsPresenter{
    
    let view : TeamViewProtocol?
    init(view: TeamViewProtocol)
    {
        self.view = view
    }
    
    func openTeamWebstie(link:String) {
        let website = URL(string: "https://\(link)")!
        UIApplication.shared.open(website)
        
    }
    func openTeamFacebook(link:String) {
        var fb = URL(string:"fb://\(link)")!
        if !UIApplication.shared.canOpenURL(fb) {
            fb = URL(string: "https://\(link)")!
        }
        UIApplication.shared.open(fb)
    }
    func openTeamTwitter(link:String) {
        var twitter = URL(string:"twitter://\(link)")!
        if !UIApplication.shared.canOpenURL(twitter) {
            twitter = URL(string: "https://\(link)")!
        }
        UIApplication.shared.open(twitter)
        
    }
    func openTeamInstagram(link:String) {
        var instagram = URL(string:"instagram://\(link)")!
        if !UIApplication.shared.canOpenURL(instagram) {
            instagram = URL(string: "https://\(link)")!
        }
        UIApplication.shared.open(instagram)
    }
    func backtoLeagues() {
        view?.didBackBtnPressed()
    }
    
}
