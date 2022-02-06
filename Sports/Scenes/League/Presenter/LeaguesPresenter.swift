//
//  LeaguesPresenter.swift
//  Sports
//
//  Created by Ahmed on 1/31/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation

protocol LeaguesView: class, GeneralView {
    func openYoutube(youtubeLink: String)
}

protocol countrysLeague: LeaguesView {
    func navigateToLeagueDetailsScreen(country: Country)
}

protocol LeagueCellView {
    var youtubePressed: (() -> ())? { get set }
    var addToFavourite: (() -> ())? { get set }
    func displayLeagueImage(leagueImageURL: String)
    func displayLeagueName(leagueName: String)
}

class LeaguesPresenter {
    
    private weak var view: LeagueViewController?
    private let interactor: LeaguesAPIProtocol = LeagueAPI()
    private var interactorCD: CoreDataManager?
    private var countrys = [Country]()
    
    init(view: LeagueViewController, appDelegate: AppDelegate) {
        self.view = view
        self.interactorCD = CoreDataManager(appDelegate: appDelegate)
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
        interactor.getLeagues(sportName: (view?.sport!.strSport)!) { [weak self] (result) in
            self?.view?.hideIndicator()
            switch result {
            case .success(let response):
                guard let leagueResult = response else { return }
                self?.countrys = leagueResult.countrys
                self?.view?.fetchingDataSuccess()
            case .failure:
                self?.view?.showError(error: "No Data Found!")
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
        
        let isExist = interactorCD!.isLeagueExist(idLeague: countrys[index].idLeague!)
        cell.displayFavouriteImage(isFavourite: isExist)
        cell.addToFavourite = {
            if isExist {
                self.interactorCD!.deleteRow(idLeague: country.idLeague!)
            } else {
                self.interactorCD!.insertRow(country: self.countrys[index])
            }
            self.view?.fetchingDataSuccess()
        }
        
    }
    
    func didSelectRow(index: Int) {
        if NetworkConnectivity.isConnectedToInternet {
            let country = countrys[index]
            view?.navigateToLeagueDetailsScreen(country: country)
        } else {
            self.view?.networkError(errorMessage: "No Internet Connection!\nPlease, open your wifi or Data!")
        }
    }
}
