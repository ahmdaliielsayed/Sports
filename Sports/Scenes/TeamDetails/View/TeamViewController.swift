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
        // Do any additional setup after loading the view.
    }
    
    func setupScreen(){
        
        stadiumView.layer.cornerRadius = 21
        stadiumView.layer.masksToBounds = true
        teamStadiumImg.layer.cornerRadius=21
        teamStadiumImg.layer.masksToBounds = true
        teamNameLb.text = team?.teamName
        stadiumLB.text = team?.stadiumName
        stadiumLocationLB.text = team?.teamLocation
        stadiumDateLB.text = team?.stadiumDate
        stadiumLocationLB.text = team?.teamLocation
        teamStadiumImg.kf.setImage(with: URL(string: team?.stadiumImg ?? ""), placeholder: nil, options: nil, progressBlock: nil)
        teamBannerImg.kf.setImage(with: URL(string: team?.teamBanner ?? ""), placeholder: nil, options: nil, progressBlock: nil)
        teamLogoImg.kf.setImage(with: URL(string: team?.teamBadge ?? ""), placeholder: nil, options: nil, progressBlock: nil)
        teamTShirtImg.kf.setImage(with: URL(string: team?.tShirtImg ?? ""), placeholder: nil, options: nil, progressBlock: nil)         
         teamInfoText.text = team?.teamDescription
        
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
    
    @IBAction func didBackBtnPressed(_ sender: Any) {
        didBackBtnPressed()
    }
    func didBackBtnPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
