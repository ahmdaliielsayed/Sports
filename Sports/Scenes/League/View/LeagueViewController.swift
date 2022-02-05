//
//  LeagueViewController.swift
//  Sports
//
//  Created by Ahmed on 1/31/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit

class LeagueViewController: UITableViewController {
    
    var presenter: LeaguesPresenter!
    let indicator = UIActivityIndicatorView(style: .large)
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var sport: Sport?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()        
        presenter = LeaguesPresenter(view: self, appDelegate: appDelegate)
        presenter.viewDidLoad()
    }
}
