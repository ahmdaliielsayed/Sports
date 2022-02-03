//
//  LeagueTVCell.swift
//  Sports
//
//  Created by Ahmed on 1/31/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit

class LeagueTVCell: UITableViewCell {

    @IBOutlet weak var ivBadge: UIImageView!
    @IBOutlet weak var lblLeague: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var btnFavOutlet: UIButton!
    
    var youtubePressed: (() -> ())?
    var addToFavourite: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnYoutube(_ sender: UIButton) {
        //print("btn youtube")
        youtubePressed?()
    }
    
    @IBAction func btnFavourite(_ sender: UIButton) {
        addToFavourite?()
    }
}

extension LeagueTVCell: LeagueCellView {
    
    func displayLeagueImage(leagueImageURL: String) {
        configureCell()

        ivBadge.kf.setImage(with: URL(string: leagueImageURL), placeholder: UIImage(named: "sports.jpg"), options: [.transition(.fade(0.7))], progressBlock: nil)
    }
    
    func configureCell() {
        ivBadge.layer.cornerRadius = ivBadge.frame.size.width / 2
        ivBadge.clipsToBounds = true
        ivBadge.layer.masksToBounds = true
        let circleColor = UIColor(rgb: 0x012c57)
        ivBadge.layer.borderColor = circleColor.cgColor
        ivBadge.layer.borderWidth = 4
        
        containerView.layer.cornerRadius = containerView.frame.height / 2
    }
    
    func displayLeagueName(leagueName: String) {
        lblLeague.text = leagueName
    }
    
    func displayFavouriteImage(isFavourite: Bool) {
        if isFavourite {
            btnFavOutlet.setImage(UIImage(named: "favourite"), for: .normal)
        } else {
            btnFavOutlet.setImage(UIImage(named: "unfavourite"), for: .normal)
        }
    }
}
