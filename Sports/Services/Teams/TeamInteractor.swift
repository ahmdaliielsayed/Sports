//
//  TeamInteractor.swift
//  Sports
//
//  Created by Mohamed Adel on 2/6/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
import Alamofire

enum TeamInteractor{
    case getTeamsData(leagueName:String)
}

extension TeamInteractor : TargetType{
    var baseURL: String {
        return APIConstants.BASE_URL
    }
    var path: String {
        return APIConstants.GET_TEAMS
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: Task {
        switch self {
        case .getTeamsData(let leagueName):
            return .requestParameters(parameters: ["l":leagueName], encododing: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
}
