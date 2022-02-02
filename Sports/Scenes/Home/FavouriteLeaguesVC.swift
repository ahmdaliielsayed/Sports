//
//  FavouriteLeaguesVC.swift
//  Sports
//
//  Created by Ahmed on 1/30/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit

class FavouriteLeaguesVC: UIViewController {

    @IBOutlet weak var tableViewLeague: UITableView!
    
    var presenter: LeaguesCDPresenter!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupNavigationController()
        setupTabBarController()
        
        presenter = LeaguesCDPresenter(view: self, appDelegate: appDelegate)
        presenter.viewDidLoad()
    }
}
