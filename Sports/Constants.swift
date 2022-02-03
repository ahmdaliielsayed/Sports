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

enum ErrorMessage: String {
    case statusCodeError = "Something went wrong with statusCode!\nPlease, try again later."
    case resultValueError = "Something went wrong with resultValue!\nPlease, try again later."
    case jsonSerializationError = "Something went wrong with JSONSerialization!\nPlease, try again later."
    case jsonDecoderError = "Something went wrong with JSONDecoder!\nPlease, try again later."
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

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
