//
//  LeagueDetailsIndicator.swift
//  Sports
//
//  Created by Mohamed Adel on 2/3/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
import Alamofire

enum LeagueDetailsInteractor{
    case getLeagueDetails(leagueId:String)
}

extension LeagueDetailsInteractor : TargetType{
    var baseURL: String {
        return APIConstants.BASE_URL
    }
    var path: String {
        return APIConstants.GET_LEAGUE
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: Task {
        switch self {
        case .getLeagueDetails(let leagueId):
            return .requestParameters(parameters: ["id":leagueId], encododing: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
}
