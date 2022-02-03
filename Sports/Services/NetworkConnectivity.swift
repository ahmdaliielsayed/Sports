//
//  NetworkConnectivity.swift
//  Sports
//
//  Created by Ahmed on 2/1/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
import Alamofire

class NetworkConnectivity {
    class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
