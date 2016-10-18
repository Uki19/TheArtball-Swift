//
//  SessionManager.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/24/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation

struct SessionManager {
    
    var session: URLSession?
    
    static let defaultManager: SessionManager = {
        var instance = SessionManager()
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let session = URLSession(configuration: configuration)
        instance.session = session
        return instance
    }()
    
}
