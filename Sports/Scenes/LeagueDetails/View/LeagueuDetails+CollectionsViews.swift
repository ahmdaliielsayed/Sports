//
//  LeagueuDetails+CollectionsViews.swift
//  Sports
//
//  Created by Mohamed Adel on 2/4/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
import UIKit

extension LeaguesDetailsVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    //300 210
    func setupCollectionView(){
        
        //MARK:-upcomingCollectionView section
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //layout.itemSize = CGSize(width: 300, height: 210)
        upcomingCollectionView.collectionViewLayout = layout
        upcomingCollectionView.register(upcomingCollectionViewCell.nib(), forCellWithReuseIdentifier: "upcomingCollectionViewCell")
        upcomingCollectionView.delegate = self
        upcomingCollectionView.dataSource = self
        
        //MARK:-leastCollectionView section
        let secLayout = UICollectionViewFlowLayout()
        secLayout.scrollDirection = .vertical
        //secLayout.itemSize = CGSize(width: 330, height: 210)
        leastCollectionView.collectionViewLayout = secLayout
        leastCollectionView.register(lastestCollectionViewCell.nib(), forCellWithReuseIdentifier: "lastestCollectionViewCell")
        leastCollectionView.delegate = self
        leastCollectionView.dataSource = self
        //MARK:-TeamsCollectionView w= 184, h= 135
        
        let teamLayout = UICollectionViewFlowLayout()
        teamLayout.scrollDirection = .horizontal
        //secLayout.itemSize = CGSize(width: 330, height: 210)
        teamsCollectionView.collectionViewLayout = teamLayout
        teamsCollectionView.register(TeamsCollectionViewCell.nib(), forCellWithReuseIdentifier: "TeamsCollectionViewCell")
        teamsCollectionView.delegate = self
        teamsCollectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == upcomingCollectionView{
            return presenter?.getupComingCount() ?? 0
        }
        else if collectionView == leastCollectionView{
            return presenter?.getlatestCount() ?? 0
        }
        else{
            return presenter?.getTeamsCount() ?? 0
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == upcomingCollectionView)
        {
            let cell : upcomingCollectionViewCell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCollectionViewCell", for: indexPath) as! upcomingCollectionViewCell
            presenter?.configureUpComingEventCell(cell: cell, index: indexPath.row)
            return cell
        }
        else if(collectionView == leastCollectionView)
        {
            let cell : lastestCollectionViewCell = leastCollectionView.dequeueReusableCell(withReuseIdentifier: "lastestCollectionViewCell", for: indexPath) as! lastestCollectionViewCell
            presenter?.configureLatestEventCell(cell: cell, index: indexPath.row)
            return cell
        }
        let cell : TeamsCollectionViewCell = teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCollectionViewCell", for: indexPath) as! TeamsCollectionViewCell
        presenter?.configureTeamsData(cell: cell, index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == teamsCollectionView{
            presenter?.didSelectTeam(index: indexPath.row)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == upcomingCollectionView{
            return CGSize(width: 300, height: 210)
        }
        else if (collectionView == teamsCollectionView)
        {
            return CGSize(width:184, height: 135)
        }
        return CGSize(width:Int(leastCollectionView.frame.width), height: Int(leastCollectionView.frame.height))
        
    }
}
