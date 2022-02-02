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

        // Do any additional setup after loading the view.
        setupTableView()
        setupNavigationController()
        setupTabBarController()
        
        presenter = LeaguesCDPresenter(view: self, appDelegate: appDelegate)
        presenter.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
