//
//  NewsItem.swift
//  TheArtball
//
//  Created by Uros Zivaljevic on 9/24/16.
//  Copyright © 2016 Uros Zivaljevic. All rights reserved.
//

import Foundation

struct NewsItem: Model {
    
    var id: Int
    var title: String
    var body: String
    var imageUrl: String
    var date: String
    var important: Bool
    var category: Category
    var comments: [Comment]
    
    init?(withDictionary dictionary: JSONObject) {
        
        guard let id = dictionary["id"] as? Int,
            let title = dictionary["title"] as? String,
            let body = dictionary["content"] as? String,
            let imageUrl = dictionary["image"] as? String,
            let date = dictionary["date"] as? String,
            let important = dictionary["important"] as? Int,
            let categoryId = dictionary["category"] as? Int,
            let commentsDictionary = dictionary["comments"] as? JSONArray
            else { return nil }
        
        self.id = id
        self.title = title
        self.body = body
        self.imageUrl = imageUrl
        self.date = date
        self.important = (important == 1 ? true : false)
        self.category = Category(rawValue: categoryId) ?? .all
        
        comments = [Comment]()
        for commentJSON in commentsDictionary {
            if let comment = Comment(withDictionary: commentJSON) {
                comments.append(comment)
            }
        }
    }
    
}
