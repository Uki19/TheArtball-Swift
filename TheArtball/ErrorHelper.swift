//
//  ErrorHelper.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/28/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation
import UIKit

struct ErrorHelper {
    
    static let domain = "com.uroszivaljevic.theartball.error"
    
    private static func error(withResponse response: HTTPURLResponse) -> NSError {

        var userInfo = [AnyHashable : Any]()
        
        switch response.statusCode {
        case HTTPStatusCode.kNotFound:
            userInfo[NSLocalizedDescriptionKey] = "Error: Not Found."
        default:
            userInfo[NSLocalizedDescriptionKey] = "An error has occured."
        }
        
        let error = NSError(domain: domain, code: response.statusCode, userInfo: userInfo)
        
        return error
    }
    
    static func error(withResponse response: HTTPURLResponse, responseData: Any) -> NSError {
        
        var userInfo = [AnyHashable : Any]()
        
        guard let responseData = responseData as? JSONObject else {
            return self.error(withResponse: response)
        }
        
        if let responseError = ResponseError(withDictionary: responseData) {
            userInfo[NSLocalizedDescriptionKey] = responseError.errorMessage
        } else {
            userInfo[NSLocalizedDescriptionKey] = "An error has occured."
        }
        
        let error = NSError(domain: domain, code: response.statusCode, userInfo: userInfo)
        
        return error
    }
    
}
