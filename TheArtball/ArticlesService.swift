//
//  ArticlesService.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/27/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation

struct ArticlesService {
    
    typealias CompletionClosure = (Error?, Any) -> Void
    
    func getAllArticles(completionHandler: @escaping CompletionClosure) {
    
        BaseService.get(resource: Resource.kArticles) { (error, response, responseData) in
            var articles = [Article]()
            if let responseData = responseData as? JSONArray {
                for responseArticle in responseData {
                    if let article = Article(withDictionary: responseArticle) {
                        articles.append(article)
                    }
                }
            }
            completionHandler(error, articles)
        }
        
    }
    
}
