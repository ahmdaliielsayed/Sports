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
       case .getLeagues(let sportName):
           return APIConstants.GET_ALL_LEAGUES + sportName
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
           return .requestPlain
           //return .requestParameters(parameters: ["s": sportName], encododing: JSONEncoding.default)
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
