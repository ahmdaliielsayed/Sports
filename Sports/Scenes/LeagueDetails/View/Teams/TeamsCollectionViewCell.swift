//
//  TeamsCollectionViewCell.swift
//  Sports
//
//  Created by Mohamed Adel on 2/1/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit
import Kingfisher

protocol GetTeamDataProtocol {
    func getTeam(name:String,img:String)
}

class TeamsCollectionViewCell: UICollectionViewCell,GetTeamDataProtocol {
       
    @IBOutlet weak var teamImg: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var cellSuperView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellSuperView.layer.cornerRadius = 20
        cellSuperView.layer.masksToBounds = true
    }
    
    static func nib() -> UINib
    {
        return UINib(nibName: "TeamsCollectionViewCell", bundle: nil)
    }
    
    func getTeam(name: String, img: String) {
        teamName?.text = name
        teamImg.kf.indicatorType = .activity
        teamImg.kf.setImage(with: URL(string: img), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
    }
}
