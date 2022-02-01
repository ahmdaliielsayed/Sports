//
//  HomePresenter.swift
//  Sports
//
//  Created by Ahmed on 1/28/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation

protocol GeneralView {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func networkError(errorMessage: String)
    func showError(error: String)
}

protocol SportsView: class, GeneralView {
    func navigateToLeaguesScreen(sport: Sport)
}

protocol SportCellView {
    func displaySportImage(imageURL: String)
    func displaySportName(sportName: String)
}

class SportsPresenter {
    
    private weak var view: SportsView?
    private let interactor: SportsAPIProtocol = SportAPI()
    private var sports = [Sport]()
    
    init(view: SportsView) {
        self.view = view
    }
    
    func viewDidLoad() {
        if NetworkConnectivity.isConnectedToInternet {
            getSports()
        } else {
            view?.networkError(errorMessage: "No Internet Connection!\nPlease, open your wifi or Data!")
        }
    }
    
    func getSports() {
        view?.showIndicator()
        
        interactor.getSports { (result) in
            self.view?.hideIndicator()
            switch result {
            case .success(let response):
                guard let sportResult = response else { return }
                self.sports = sportResult.sports
                self.view?.fetchingDataSuccess()
            case .failure(let error):
                self.view?.showError(error: error.localizedDescription)
            }
        }
    }
    
    func getSportsCount() -> Int {
        return sports.count
    }
    
    func configure(cell: SportCellView, for index: Int) {
        let sport = sports[index]
        cell.displaySportImage(imageURL: sport.strSportThumb!)
        cell.displaySportName(sportName: sport.strSport!)
    }
    
    func didSelectRow(index: Int) {
        let sport = sports[index]
        view?.navigateToLeaguesScreen(sport: sport)
    }
}
