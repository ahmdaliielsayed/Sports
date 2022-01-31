//
//  BaseModel.swift
//  Sports
//
//  Created by Ahmed on 1/31/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation

class BaseResult<T: Decodable>: Decodable{
    var data: T?
}
