//
//  Model.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/25/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation

enum JSONParsingError: Error {
    case invalidParameters
}

protocol Model {
    
    init?(withDictionary dictionary: JSONObject)
    
}
