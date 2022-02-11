//
//  TeamViewController.swift
//  Sports
//
//  Created by Mohamed Adel on 2/10/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController,TeamViewProtocol{
    
    

    var presenter : TeamDetailsPresenter?
    var team : Team?
    @IBOutlet weak var teamCountryLB: UILabel!
    @IBOutlet weak var stadiumLB: UILabel!
    @IBOutlet weak var teamNameLb: UILabel!
    
    @IBOutlet weak var stadiumLocationLB: UILabel!
    @IBOutlet weak var stadiumDateLB: UILabel!
    
    
    @IBOutlet weak var teamStadiumImg: UIImageView!
    @IBOutlet weak var teamLogoImg: UIImageView!
    @IBOutlet weak var teamBannerImg: UIImageView!
    @IBOutlet weak var teamTShirtImg: UIImageView!
    @IBOutlet weak var teamInfoText: UITextView!
    @IBOutlet weak var stadiumView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
        presenter = TeamDetailsPresenter(view: self)
    }
    
    func setupScreen(){
        
        stadiumView.layer.cornerRadius = 21
        stadiumView.layer.masksToBounds = true
        teamStadiumImg.layer.cornerRadius=21
        teamStadiumImg.layer.masksToBounds = true
        if team?.stadiumName == ""{
            stadiumView.isHidden  = true
        }
    
        
        
        teamNameLb.text = team?.teamName
        stadiumLB.text = team?.stadiumName
        stadiumLocationLB.text = team?.teamLocation
        stadiumDateLB.text = team?.stadiumDate
        stadiumLocationLB.text = team?.teamLocation
        teamCountryLB.text = team?.teamCountry
        teamStadiumImg.kf.setImage(with: URL(string: team?.stadiumImg ?? ""), placeholder: UIImage(named: "no data"), options: nil, progressBlock: nil)
        teamBannerImg.kf.setImage(with: URL(string: team?.teamBanner ?? ""), placeholder:UIImage(named: "sorry no data"), options: nil, progressBlock: nil)
        teamLogoImg.kf.setImage(with: URL(string: team?.teamBadge ?? ""), placeholder: UIImage(named: "no data"), options: nil, progressBlock: nil)
        teamTShirtImg.kf.setImage(with: URL(string: team?.tShirtImg ?? ""), placeholder: UIImage(named: "no data"), options: nil, progressBlock: nil)
        if team?.teamDescription == "" {
            teamInfoText.text = "Sorry no Details found........."
        }
        else{
         teamInfoText.text = team?.teamDescription
        }
        
    }
    
    @IBAction func didWebsitePressed(_ sender: Any) {
        presenter?.openTeamWebstie(link: team?.teamWebsite ?? "")
    }
    
    @IBAction func didFacebookPressed(_ sender: Any) {
        presenter?.openTeamFacebook(link: team?.teamFacebook ?? "")
    }
    
    @IBAction func didInstagramPressed(_ sender: Any) {
        presenter?.openTeamInstagram(link : team?.teamInstagram ?? "")
    }
    
    @IBAction func didTwitterPressed(_ sender: Any) {
         presenter?.openTeamTwitter(link: team?.teamTwitter ?? "")
    }
    
    
    @IBAction func didYoutubePressed(_ sender: Any) {
        presenter?.openTeamYouTube(link: team?.teamYoutube ?? "")
    }
    
    @IBAction func didBackBtnPressed(_ sender: Any) {
        didBackBtnPressed()
    }
    func didBackBtnPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
