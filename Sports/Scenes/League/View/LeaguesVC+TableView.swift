//
//  LeaguesVC+TableView.swift
//  Sports
//
//  Created by Ahmed on 1/31/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
import UIKit

extension LeagueViewController {
    
    func setupNavigationController() {
        let backColor = UIColor(rgb: 0x012c57)
        navigationController?.navigationBar.barTintColor = backColor
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func setupRefreshControl() {
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
        rfreshControl.attributedTitle = NSAttributedString(string: "Refresh", attributes: attributes)
         rfreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        rfreshControl.tintColor = .white
        tableView.refreshControl = refreshControl
    }
    
    @objc func refresh(_ sender: AnyObject) {
        presenter.viewDidLoad()
        tableView.reloadData()
        rfreshControl.endRefreshing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getLeaguesCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "LeagueTVCell", for: indexPath) as! LeagueTVCell

        presenter.configure(cell: &cell, for: indexPath.row)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return UIScreen.main.bounds.size.height / 8
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(index: indexPath.row)
    }
}
