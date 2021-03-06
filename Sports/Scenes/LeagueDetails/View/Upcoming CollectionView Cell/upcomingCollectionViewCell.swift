//
//  upcomingCollectionViewCell.swift
//  Sports
//
//  Created by Mohamed Adel on 2/1/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit

class upcomingCollectionViewCell: UICollectionViewCell,upcomingEventCellViewProtocol{
    
    
        
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var secondTeamLB: UILabel!
    @IBOutlet weak var firstTeamLB: UILabel!
    @IBOutlet weak var firstTeamimg: UIImageView!
  
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var upcomingDate: UILabel!
    @IBOutlet weak var secondTeamImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius = 20
        cellView.layer.masksToBounds = true
        
    }
    
    static func nib()->UINib{
        return UINib(nibName: "upcomingCollectionViewCell", bundle: nil)
    }
    func updateTeamsName(firstTeam: String, secondTeam: String) {
           firstTeamLB.text = firstTeam
           secondTeamLB.text = secondTeam
    }
    func getDate(date: String,time:String) {
        upcomingDate.text = date
        eventTime.text=time
    }
   func updateFirstTeamImgs(firstTeamimg: String) {
    self.firstTeamimg.kf.setImage(with: URL(string: firstTeamimg), placeholder: nil, options: nil, progressBlock: nil)
   }
   
   func updateSecondTeamImgs(secondTeamimg: String) {
    self.secondTeamImg.kf.setImage(with: URL(string: secondTeamimg), placeholder: nil, options: nil, progressBlock: nil)
   }

    

}
