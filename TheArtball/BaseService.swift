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
typealias ServiceCompletionClosure = (Error?, Any?) -> Void

struct BaseService {
    
    static let baseUrl = "http://theartball.com/api/v2/"
//    static let baseUrl = "http://www.theartball.com/admin/iOS/"
    
    typealias BaseCompletionClosure = (Error?, HTTPURLResponse, Any) -> Void
    
    static func get(resource: String, completionHandler: @escaping BaseCompletionClosure) {
        
        let encodedUrl = (baseUrl + resource).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = URL(string: encodedUrl!)
        
        let dataTask = SessionManager.defaultManager.session?.dataTask(with: url!) {
            (data, response, error) in
            
            if let response = response as? HTTPURLResponse {
                
                
                if let repsonseError = error {
                    completionHandler(repsonseError, response, data)
                    return
                }
                
                if let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) {
                    completionHandler(nil, response, jsonData)
                } else {
                    completionHandler(nil, response, data)
                }
            }
            
        }
        dataTask?.resume()
    }
    
    static func post(resource: String, parameters: [String: String], completionHandler: @escaping BaseCompletionClosure) {
        
        let url = URL(string: baseUrl + resource)
        var httpRequest = URLRequest(url: url!)
        httpRequest.httpMethod = "POST"
        if let jsonParams = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) {
            httpRequest.httpBody = jsonParams
        }
        
        let dataTask = SessionManager.defaultManager.session?.dataTask(with: httpRequest) {
            (data, response, error) in
            
            if let response = response as? HTTPURLResponse {
                
                if let repsonseError = error {
                    completionHandler(repsonseError, response, data)
                    return
                }
                
                if let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) {
                    completionHandler(nil, response, jsonData)
                }
            }
            
        }
        dataTask?.resume()
    }
    
}
