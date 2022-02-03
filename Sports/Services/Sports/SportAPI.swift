//
//  SportAPI.swift
//  Sports
//
//  Created by Ahmed on 1/31/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation

protocol SportsAPIProtocol {
    func getSports(completionHandler: @escaping (Swift.Result<SportResult?, NSError>) -> Void)
}

class SportAPI: BaseAPI<SportInteractor>, SportsAPIProtocol {
    
    //MARK:- Requests
    func getSports(completionHandler: @escaping (Swift.Result<SportResult?, NSError>) -> Void) {
        self.fetchData(target: .getSports, responseClass: SportResult.self) { (result) in
            completionHandler(result)
        }
    }
}
