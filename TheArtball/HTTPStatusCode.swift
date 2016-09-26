//
//  ResponseStatusCode.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/24/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation

struct HTTPStatusCode {
    
    static let kOK = 200
    static let kCreated = 201
    static let kAccepted = 202
    static let kNoContent = 204
    
    static let kBadRequest = 400
    static let kUnauthorized = 401
    static let kForbidden = 403
    static let kNotFound = 404
    static let kMethodNotAllowed = 405
    
    static let kInternalServerError = 500
    static let kNotImplemented = 501
    static let kBadGateway = 502
    static let kServiceUnavailable = 503
    
}
