//
//  LeaguesCDPresenter.swift
//  Sports
//
//  Created by Ahmed on 2/2/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation

protocol CoreDataLeagues {
    func fetchingDataSuccess()
    func showError(error: String)
    func navigateToLeagueDetailsScreen(country: CountryModel)
}

class LeaguesCDPresenter {
    
    private weak var view: FavouriteLeaguesVC?
    
    private var interactor: CoreDataManager?
    var countrysList: Array<CountryModel> = []
    
    init(view: FavouriteLeaguesVC, appDelegate: AppDelegate) {
        self.view = view
        interactor = CoreDataManager(appDelegate: appDelegate)
    }
    
    func viewDidLoad() {
        getLeagues()
    }
    
    func getLeagues() {
        countrysList = (interactor?.selectAllCountrys())!
        self.view?.fetchingDataSuccess()
    }
    
    func getLeaguesCount() -> Int {
        return countrysList.count
    }
    
    func configure(cell: inout FavouriteLeagueTVCell, for index: Int) {
        let country = countrysList[index]
        cell.displayLeagueImage(leagueImageURL: country.strBadge!)
        cell.displayLeagueName(leagueName: country.strLeague!)
        cell.youtubePressed = {
            if NetworkConnectivity.isConnectedToInternet {
                if self.countrysList[index].strYoutube!.isEmpty {
                    self.view?.networkError(errorMessage: "Link is Empty!")
                } else {
                    self.view?.openYoutube(youtubeLink: self.countrysList[index].strYoutube!)
                }
            } else {
                self.view?.networkError(errorMessage: "No Internet Connection!\nPlease, open your wifi or Data!")
            }
        }
    }
    
    func didSelectRow(index: Int) {
        if NetworkConnectivity.isConnectedToInternet {
            let country = countrysList[index]
            view?.navigateToLeagueDetailsScreen(country: country)
        } else {
            self.view?.networkError(errorMessage: "No Internet Connection!\nPlease, open your wifi or Data!")
        }
    }
}
