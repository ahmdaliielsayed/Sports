//
//  SportCVCell.swift
//  Sports
//
//  Created by Ahmed on 1/30/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit
import Kingfisher

class SportCVCell: UICollectionViewCell {
    
    @IBOutlet weak var ivSportThumb: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var uiViewTransparent: UIView!
    
}

extension SportCVCell: SportCellView {
    
    func displaySportImage(imageURL: String) {
        configureCell()
        
        ivSportThumb.kf.setImage(with: URL(string: imageURL), placeholder: UIImage(named: "sports.jpg"), options: [.transition(.fade(0.7))], progressBlock: nil)
    }
    
    func configureCell() {
        ivSportThumb.layer.cornerRadius = 20
        ivSportThumb.clipsToBounds = true
        ivSportThumb.layer.masksToBounds = true
        uiViewTransparent.layer.cornerRadius = 20
    }
    
    func displaySportName(sportName: String) {
        lblName.text = sportName
    }
}
