//
//  lastestCollectionViewCell.swift
//  Sports
//
//  Created by Mohamed Adel on 2/1/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit

class lastestCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet weak var cellSuperView: UIView!
    @IBOutlet weak var firstTeamImg: UIImageView!
    @IBOutlet weak var secondTeamImg: UIImageView!
    public static let reusableCellIdentifierCell = "lastestCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        view.layer.cornerRadius = 5;
//        view.layer.masksToBounds = true;
        cellSuperView.layer.cornerRadius = 20
        cellSuperView.layer.masksToBounds = true
//        firstTeamImg.roundImg()
//        secondTeamImg.roundImg()
    }
    
    static func nib()->UINib{
        return UINib(nibName: "lastestCollectionViewCell", bundle: nil)
    }


}
