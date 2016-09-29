//
//  Error.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/28/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation

struct ResponseError: Error, Model {
    
    var errorMessage: String
    
    init?(withDictionary dictionary: JSONObject) {
        
        guard let errorMessage = dictionary["error_message"] as? String else {
            return nil
        }
        self.errorMessage = errorMessage
    }
    
}
