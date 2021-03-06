//
//  LeagueInteractor.swift
//  Sports
//
//  Created by Ahmed on 1/31/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
import Alamofire

enum LeagueInteractor{
   case getLeagues(sportName: String)
}

extension LeagueInteractor: TargetType {
   var baseURL: String {
       switch self {
       default:
           return APIConstants.BASE_URL
       }
   }
   
   var path: String {
       switch self {
       case .getLeagues:
           return APIConstants.GET_ALL_LEAGUES
    }
   }
   
   var method: HTTPMethod {
       switch self {
       case .getLeagues:
           return .get
       }
   }
   
   var task: Task {
       switch self {
       case .getLeagues(let sportName):
        return .requestParameters(parameters: ["c":"England", "s": sportName], encododing: URLEncoding.default)
       }
   }
   
   var headers: [String : String]? {
       switch self {
       default:
           //return ["Authorization": "Token"]
           return [:]
       }
   }
}
