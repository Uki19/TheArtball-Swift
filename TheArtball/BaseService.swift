//
//  BaseService.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/24/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation

typealias JSONObject = [String: Any]
typealias JSONArray = Array<JSONObject>

struct BaseService {
    
//    static let baseUrl = "https://kidsterapp.co"
    static let baseUrl = "https://jsonplaceholder.typicode.com"
    
    typealias CompletionClosure = (Error?, URLResponse, Any) -> Void
    
    static func get(resource: String, completionHandler: @escaping CompletionClosure) {
        
        let url = URL(string: baseUrl + resource)
        
        let dataTask = SessionManager.defaultManager.session?.dataTask(with: url!) {
            (data, response, error) in
            if let repsonseError = error, let urlResponse = response {
                completionHandler(repsonseError, urlResponse, data)
                return
                
            }
            
            if let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments), let urlResponse = response {
                completionHandler(nil, urlResponse, jsonData)
            }
            
        }
        dataTask?.resume()
    }
    
    static func post(resource: String, parameters: [String: String], completionHandler: @escaping CompletionClosure) {
        
        let url = URL(string: baseUrl + resource)
        var httpRequest = URLRequest(url: url!)
        httpRequest.httpMethod = "POST"
        if let jsonParams = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) {
            httpRequest.httpBody = jsonParams
        }
        
        let dataTask = SessionManager.defaultManager.session?.dataTask(with: httpRequest) {
            (data, response, error) in
            if let repsonseError = error, let urlResponse = response {
                completionHandler(repsonseError, urlResponse, data)
                return
            }
            
            if let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments), let urlResponse = response {
                completionHandler(nil, urlResponse, jsonData)
            }

            
            
        }
        dataTask?.resume()
    }
    
}
