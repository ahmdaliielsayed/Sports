//
//  FavouriteLeaguesVC+TableView.swift
//  Sports
//
//  Created by Ahmed on 2/2/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
import UIKit

extension FavouriteLeaguesVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupNavigationController() {
        let backColor = UIColor(rgb: 0x012c57)
        navigationController?.navigationBar.barTintColor = backColor
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    func setupTableView() {
        tableViewLeague.dataSource = self
        tableViewLeague.delegate = self
    }
    
    func setupTabBarController() {
        let backColor = UIColor(rgb: 0x012c57)
        tabBarController?.tabBar.barTintColor = backColor
        tabBarController?.tabBar.tintColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getLeaguesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteLeagueTVCell", for: indexPath) as! FavouriteLeagueTVCell

        presenter.configure(cell: &cell, for: indexPath.row)

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(index: indexPath.row)
    }
}
