//
//  TeamsInteractor.swift
//  Sports
//
//  Created by Mohamed Adel on 2/3/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
import Alamofire


enum TeamInteractor
{
    case getTeam(teamId:String)
}

//extension TeamInteractor : TargetType
//{
//    var baseURL: String {
//        switch self {
//        default:
//            return APIConstants.BASE_URLA
//        }
//    }
//
//    var path: String {
//        <#code#>
//    }
//
//    var method: HTTPMethod {
//        <#code#>
//    }
//
//    var task: Task {
//        <#code#>
//    }
//
//    var headers: [String : String]? {
//        <#code#>
//    }
//
//
//}
