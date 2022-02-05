//
//  LeaguesDetailsVC.swift
//  Sports
//
//  Created by Mohamed Adel on 1/28/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit

class LeaguesDetailsVC: UIViewController {
    
    var idLeague: String?
    let indicator = UIActivityIndicatorView(style: .large)
    var presenter : LeagueDetailsPresenter?
    //MARK:-Outlet section
    
    
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
    @IBOutlet weak var leastCollectionView: UICollectionView!
   
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    
    
    
    //MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LeagueDetailsPresenter(view: self)
        presenter?.viewdidload()
        setupCollectionView()
        addingSwipe()

        // Do any additional setup after loading the view.
        
        print(idLeague!)
    }
    

}


extension LeaguesDetailsVC {
    
    func addingSwipe()
    {
        let swipeRight = UISwipeGestureRecognizer(target: self, action:
             #selector(swipeFunc(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    @objc func swipeFunc(gesture : UISwipeGestureRecognizer)
    {
        dismiss(animated: true, completion: nil)
    }
    
}
