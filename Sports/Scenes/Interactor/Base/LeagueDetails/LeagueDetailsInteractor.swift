//
//  LeagueDetailsInteractor.swift
//  Sports
//
//  Created by Mohamed Adel on 2/3/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
import Alamofire

enum LeagueDetailsIndicator{
    case getLeagueDetails(leagueId:String)
    
}
extension LeagueDetailsIndicator : TargetType
{
    var baseURL: String {
        switch self {
            default:
                return APIConstants.BASE_URL
            }
    }
    var path: String {
        switch self {
            default:
                return APIConstants.GET_LEAGUE
            }
    }
    var method: HTTPMethod {
        switch self {
            case .getLeagueDetails:
                return .get
            }
    }
    
    var task: Task {
        switch self {
        case .getLeagueDetails(let leagueId):
            return .requestParameters(parameters: ["id": leagueId], encododing: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
       switch self {
        default:
            return [:]
        }
    }
    
    
}
