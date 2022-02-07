//
//  TeamDetailVC.swift
//  Sports
//
//  Created by Mohamed Adel on 2/3/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit

class TeamDetailVC: UIViewController {

//MARK: - Property Sectoin
    var team : Team?
    @IBOutlet weak var teamImg: UIImageView!
    @IBOutlet weak var stadiumImg: UIImageView!
    @IBOutlet weak var teamDescription: UITextView!
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var teamName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }
    
    func setupView(){
         infoView.layer.cornerRadius = 25
         infoView.layer.masksToBounds = true
        stadiumImg.layer.cornerRadius=25
        stadiumImg.layer.masksToBounds = true
        teamName.text = team?.teamName
        teamImg.kf.indicatorType = .activity
        teamImg.kf.setImage(with: URL(string: team?.teamBadge ?? ""), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        stadiumImg.kf.indicatorType = .activity
        stadiumImg.kf.setImage(with: URL(string: team?.stadiumImg ?? ""), placeholder: UIImage(named: "no image"), options: [.transition(.fade(0.7))], progressBlock: nil)
       
        
        teamDescription.text = team?.teamDescription
    }
}
