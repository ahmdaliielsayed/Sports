//
//  LeaguesPresenter.swift
//  Sports
//
//  Created by Ahmed on 1/31/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation

protocol LeaguesView: class, GeneralView {
    func navigateToLeagueDetailsScreen(country: Country)
    func openYoutube(youtubeLink: String)
}

protocol LeagueCellView {
    var youtubePressed: (() -> ())? { get set }
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
        if NetworkConnectivity.isConnectedToInternet {
            getLeagues()
        } else {
            view?.networkError(errorMessage: "No Internet Connection!\nPlease, open your wifi or Data!")
        }
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
    
    func configure(cell: inout LeagueTVCell, for index: Int) {
        let country = countrys[index]
        cell.displayLeagueImage(leagueImageURL: country.strBadge!)
        cell.displayLeagueName(leagueName: country.strLeague!)
        cell.youtubePressed = {
            if NetworkConnectivity.isConnectedToInternet {
                if self.countrys[index].strYoutube!.isEmpty {
                    self.view?.networkError(errorMessage: "Link is Empty!")
                } else {
                    self.view?.openYoutube(youtubeLink: self.countrys[index].strYoutube!)
                }
            } else {
                self.view?.networkError(errorMessage: "No Internet Connection!\nPlease, open your wifi or Data!")
            }
        }
    }
    
    func didSelectRow(index: Int) {
        let country = countrys[index]
        view?.navigateToLeagueDetailsScreen(country: country)
    }
}
