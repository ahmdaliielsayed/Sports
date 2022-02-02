//
//  FavouriteLeagueTVCell.swift
//  Sports
//
//  Created by Ahmed on 2/1/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit

class FavouriteLeagueTVCell: UITableViewCell {
    
    @IBOutlet weak var ivBadge: UIImageView!
    @IBOutlet weak var lblLeague: UILabel!
    @IBOutlet weak var containerView: UIView!
    
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
        youtubePressed?()
    }
}

extension FavouriteLeagueTVCell: LeagueCellView {
    func displayFavouriteImage(isFavourite: Bool) {
        
    }
    
    
    func displayLeagueImage(leagueImageURL: String) {
        configureCell()

        ivBadge.kf.setImage(with: URL(string: leagueImageURL), placeholder: UIImage(named: "sports.jpg"), options: [.transition(.fade(0.7))], progressBlock: nil)
    }
    
    func configureCell() {
        ivBadge.layer.cornerRadius = ivBadge.frame.size.width / 2
        ivBadge.clipsToBounds = true
        ivBadge.layer.masksToBounds = true
        ivBadge.layer.borderColor = UIColor.black.cgColor
        ivBadge.layer.borderWidth = 4
        
        containerView.layer.cornerRadius = containerView.frame.height / 2
    }
    
    func displayLeagueName(leagueName: String) {
        lblLeague.text = leagueName
    }
}
