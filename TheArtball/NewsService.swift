//
//  NewsService.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/25/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation

struct NewsService {
    
    typealias CompletionClosure = (Error?, Any) -> Void
    
    func getAllNews(completionHandler: @escaping CompletionClosure) {
        
        BaseService.get(resource: Resource.kNews) {(error, response, responseData) in
            
            var newsItems = [NewsItem]()
            if let responseData2 = responseData as? JSONArray {
                for responseObject in responseData2 {
                    let newsItem = NewsItem(withDictionary: responseObject)
                    newsItems.append(newsItem)
                }
            }
            
            completionHandler(error, newsItems)
        }
    }
}
