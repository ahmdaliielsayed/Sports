//
//  TeamsCollectionViewCell.swift
//  Sports
//
//  Created by Mohamed Adel on 2/1/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {

    
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

}
