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
        navigationController?.navigationBar.barTintColor = UIColor.darkGray
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    func setupTableView() {
        tableViewLeague.dataSource = self
        tableViewLeague.delegate = self
    }
    
    func setupTabBarController() {
        tabBarController?.tabBar.barTintColor = UIColor.darkGray
        tabBarController?.tabBar.tintColor = UIColor.white
    }
    
    func setupRightBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped() {
        presenter.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getLeaguesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteLeagueTVCell", for: indexPath) as! FavouriteLeagueTVCell

        // Configure the cell....
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
