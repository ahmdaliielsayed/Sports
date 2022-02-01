//
//  SportsVC+CollectionView.swift
//  Sports
//
//  Created by Ahmed on 1/30/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
import UIKit

extension SportsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        sportsCV.dataSource = self
        sportsCV.delegate = self
        //sportsCV.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
    }
    
    func setupNavigationController() {
        navigationController?.navigationBar.barTintColor = UIColor.darkGray
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func setupTabBarController() {
        tabBarController?.tabBar.barTintColor = UIColor.darkGray
        tabBarController?.tabBar.tintColor = UIColor.white
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getSportsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sportsCV.dequeueReusableCell(withReuseIdentifier: "SportCVCell", for: indexPath) as! SportCVCell
        presenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthSize = (collectionView.frame.size.width - 10) / 2
        return CGSize(width: widthSize, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectRow(index: indexPath.row)
    }
    
}