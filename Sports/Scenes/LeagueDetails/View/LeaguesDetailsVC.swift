//
//  LeaguesDetailsVC.swift
//  Sports
//
//  Created by Mohamed Adel on 1/28/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit

class LeaguesDetailsVC: UIViewController {
    
    var country: Country?
    let indicator = UIActivityIndicatorView(style: .large)
    var presenter : LeagueDetailsPresenter?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var newCountry:Country = Country()
    
    //MARK:-Outlet section
    
    
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
    @IBOutlet weak var leastCollectionView: UICollectionView!
   
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    @IBOutlet weak var btnFavOutlet: UIButton!
    
    //MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LeagueDetailsPresenter(view: self, appDelegate: appDelegate)
        presenter?.viewdidload()
        setupCollectionView()
        addingSwipe()

        // Do any additional setup after loading the view.
        presenter?.changeIconFavourite(idLeague: country!.idLeague!)
    }
    
    @IBAction func btnFavourite(_ sender: UIButton) {
        presenter?.addToFavourite(idLeague: country!.idLeague!, country: country!)
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
