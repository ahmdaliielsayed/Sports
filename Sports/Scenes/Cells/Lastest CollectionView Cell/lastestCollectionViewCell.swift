//
//  lastestCollectionViewCell.swift
//  Sports
//
//  Created by Mohamed Adel on 2/1/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit

class lastestCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet weak var firstTeamImg: UIImageView!
    @IBOutlet weak var secondTeamImg: UIImageView!
    public static let reusableCellIdentifierCell = "lastestCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        firstTeamImg.roundImg()
//        secondTeamImg.roundImg()
    }
    
    static func nib()->UINib{
        return UINib(nibName: "lastestCollectionViewCell", bundle: nil)
    }


}
