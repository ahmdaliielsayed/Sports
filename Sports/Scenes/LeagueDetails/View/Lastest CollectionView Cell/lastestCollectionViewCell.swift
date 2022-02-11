//
//  lastestCollectionViewCell.swift
//  Sports
//
//  Created by Mohamed Adel on 2/1/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit
import Kingfisher

class lastestCollectionViewCell: UICollectionViewCell, LastestEventsCellViewProtocol{
       
    
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var cellSuperView: UIView!
    @IBOutlet weak var firstTeamImg: UIImageView!
    @IBOutlet weak var secondTeamImg: UIImageView!
    @IBOutlet weak var firstTeamLB: UILabel!
    @IBOutlet weak var secondTeamLB: UILabel!
    @IBOutlet weak var scoreLB: UILabel!
    @IBOutlet weak var TimeLB: UILabel!
    
    @IBOutlet weak var eventTime: UILabel!
    
    public static let reusableCellIdentifierCell = "lastestCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellSuperView.layer.cornerRadius = 20
        cellSuperView.layer.masksToBounds = true
    }
    
    static func nib()->UINib{
        return UINib(nibName: "lastestCollectionViewCell", bundle: nil)
    }
    func updateTeamsName(fisrtTeam: String, secondTeam: String) {
        firstTeamLB.text = fisrtTeam
        secondTeamLB.text = secondTeam
    }
       
   func updateResult(result: String) {
        scoreLB.text = result
   }
    
    func updateFirstTeamImgs(firstTeamimg: String) {
        firstTeamImg.kf.setImage(with: URL(string: firstTeamimg), placeholder: UIImage(named: "no image"), options: nil, progressBlock: nil)
            
    }
    
    func updateSecondTeamImgs(secondTeamimg: String) {
        secondTeamImg.kf.setImage(with: URL(string:secondTeamimg), placeholder: UIImage(named: "no image"), options: nil, progressBlock: nil)
    }
    func updateDate(date: String,time:String) {
        eventDate.text = date
        eventTime.text = time
    }
}
