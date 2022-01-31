 //
//  SportInteractor.swift
//  Sports
//
//  Created by Ahmed on 1/31/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

 import Foundation
 import Alamofire
  
 enum SportInteractor{
    case getSports
 }
 
 extension SportInteractor: TargetType {
    var baseURL: String {
        switch self {
        default:
            return APIConstants.BASE_URL
        }
    }
    
    var path: String {
        switch self {
        case .getSports:
            return APIConstants.GET_ALL_SPORTS
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getSports:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getSports:
            return .requestPlain
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
