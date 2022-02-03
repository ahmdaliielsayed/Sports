//
//  Constants.swift
//  Sports
//
//  Created by Ahmed on 1/31/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
import UIKit

struct APIConstants {
    static let BASE_URL = "https://www.thesportsdb.com/api/v1/json/2"
    static let GET_ALL_SPORTS = "/all_sports.php"
    static let GET_ALL_LEAGUES = "/search_all_leagues.php"
    static let GET_LEAGUE = "/eventsseason.php?id="
    
    
    static let SUCCESS_RESPONSE = 200
}

struct ErrorMessage {
    static let statusCodeError = "Something went wrong with statusCode!\nPlease, try again later."
    static let resultValueError = "Something went wrong with resultValue!\nPlease, try again later."
    static let jsonSerializationError = "Something went wrong with JSONSerialization!\nPlease, try again later."
    static let jsonDecoderError = "Something went wrong with JSONDecoder!\nPlease, try again later."
}

struct Toast {
    static func showToast(controller: UIViewController, message : String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.white
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 20

        controller.present(alert, animated: true)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
}
