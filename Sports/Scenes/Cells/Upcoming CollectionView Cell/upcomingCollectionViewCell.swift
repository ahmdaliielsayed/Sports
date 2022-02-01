//
//  upcomingCollectionViewCell.swift
//  Sports
//
//  Created by Mohamed Adel on 2/1/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit

class upcomingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var firstTeamimg: UIImageView!
    @IBOutlet weak var secondTeamimg: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        firstTeamimg.roundImg()
        secondTeamImg.roundImg()
        
    }
    @IBOutlet weak var secondTeamImg: UIImageView!
    
    
    static func nib()->UINib{
        return UINib(nibName: "upcomingCollectionViewCell", bundle: nil)
    }

}
