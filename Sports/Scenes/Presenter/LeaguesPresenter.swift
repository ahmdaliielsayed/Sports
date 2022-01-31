//
//  LeaguesPresenter.swift
//  Sports
//
//  Created by Ahmed on 1/31/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation

protocol LeaguesView: class, GeneralView {
    //var sport: Sport { get set }
    func navigateToLeagueDetailsScreen(country: Country)
}

protocol LeagueCellView {
    func displayLeagueImage(leagueImageURL: String)
    func displayLeagueName(leagueName: String)
}

class LeaguesPresenter {
    
    private weak var view: LeagueViewController?
    private let interactor: LeaguesAPIProtocol = LeagueAPI()
    private var countrys = [Country]()
    
    init(view: LeagueViewController) {
        self.view = view
    }
    
    func viewDidLoad() {
        getLeagues()
    }
    
    func getLeagues() {
        view?.showIndicator()
        interactor.getLeagues(sportName: (view?.sport!.strSport)!) { (result) in
            self.view?.hideIndicator()
            switch result {
            case .success(let response):
                guard let leagueResult = response else { return }
                self.countrys = leagueResult.countrys
                self.view?.fetchingDataSuccess()
            case .failure(let error):
                self.view?.showError(error: error.localizedDescription)
            }
        }
    }
    
    func getLeaguesCount() -> Int {
        return countrys.count
    }
    
    func configure(cell: LeagueCellView, for index: Int) {
        let country = countrys[index]
        cell.displayLeagueImage(leagueImageURL: country.strBadge!)
        cell.displayLeagueName(leagueName: country.strLeague!)
    }
    
    func didSelectRow(index: Int) {
        let country = countrys[index]
        view?.navigateToLeagueDetailsScreen(country: country)
    }
}
