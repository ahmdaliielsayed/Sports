//
//  SportsVC.swift
//  Sports
//
//  Created by Ahmed on 1/30/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit

class SportsVC: UIViewController {
    
    @IBOutlet weak var sportsCV: UICollectionView!
  
    var presenter: SportsPresenter!
    let indicator = UIActivityIndicatorView(style: .large)
    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        setupCollectionView()
        setupTabBarController()
        setupRefreshControl()
        
        presenter = SportsPresenter(view: self)
        presenter.viewDidLoad()
    }
   
}
		
