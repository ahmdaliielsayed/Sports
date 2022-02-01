//
//  LeagueAPI.swift
//  Sports
//
//  Created by Ahmed on 1/31/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation

protocol LeaguesAPIProtocol {
    func getLeagues(sportName: String, completionHandler: @escaping (Swift.Result<LeagueResult?, NSError>) -> Void)
}

class LeagueAPI: BaseAPI<LeagueInteractor>, LeaguesAPIProtocol {
    
    //MARK:- Requests
    func getLeagues(sportName: String, completionHandler: @escaping (Swift.Result<LeagueResult?, NSError>) -> Void) {
        self.fetchData(target: .getLeagues(sportName: sportName), responseClass: LeagueResult.self) { (result) in
            completionHandler(result)
        }
    }
}
