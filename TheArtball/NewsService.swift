//
//  NewsService.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/25/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation

struct NewsService {
    
    func getAllNews(completionHandler: @escaping ServiceCompletionClosure) {
        
        BaseService.get(resource: Resource.kNews) {(error, response, responseData) in
            
            if error != nil {
                print(response.statusCode)
                completionHandler(error, responseData)
                return
            }
            switch response.statusCode {
                
            case HTTPStatusCode.kOK:
                var newsItems = [NewsItem]()
                if let responseData = responseData as? JSONArray {
                    for responseObject in responseData {
                        let newsItem = NewsItem(withDictionary: responseObject)
                        newsItems.append(newsItem)
                    }
                }
                completionHandler(nil, newsItems)
            default:
                completionHandler(NSError(domain: "test", code: 1, userInfo: nil), responseData)
            }
        }
    }
    
    func getNews(forCategory: Category, completionHandler: @escaping ServiceCompletionClosure) {
        
        BaseService.get(resource: Resource.kNews) {(error, response, responseData) in
            
            var newsItems = [NewsItem]()
            if let responseData = responseData as? JSONArray {
                for responseObject in responseData {
                    let newsItem = NewsItem(withDictionary: responseObject)
                    newsItems.append(newsItem)
                }
            }
            
            completionHandler(error, newsItems)
        }
    }

}
