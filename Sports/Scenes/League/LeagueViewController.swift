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
    
    var sport: Sport?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        presenter = LeaguesPresenter(view: self)
        presenter.viewDidLoad()
    }
}
