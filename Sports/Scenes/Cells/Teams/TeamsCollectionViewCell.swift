//
//  TeamsCollectionViewCell.swift
//  Sports
//
//  Created by Mohamed Adel on 2/1/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    static func nib() -> UINib
    {
        return UINib(nibName: "TeamsCollectionViewCell", bundle: nil)
    }

}
