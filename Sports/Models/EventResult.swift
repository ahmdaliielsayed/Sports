//
//  EventResult.swift
//  Sports
//
//  Created by Mohamed Adel on 2/4/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation

class EventResult : Decodable{
    var events: [Event]?
    
    
    enum CodingKeys : String,CodingKey {
            case evnets = "events"
        }
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        events = try values.decode([Event].self, forKey: .evnets)
    }
}
